class Behance
  @@behance_api_key =  'JozfVr61PLTbJ7obHSpNtRInKImNO5Ur'

  @@behance_id = 'josharonoff'

  @@url = "http://www.behance.net/v2/users/#{@@behance_id}/projects?api_key=#{@@behance_api_key}"

  def self.get_projects
    old_projects = Project.all.inject({}) do |results, project|
      results[project.id] = project.behance_id
      
      results
    end
   
    Project.delete_all
    ProjectCover.delete_all
    ProjectField.delete_all
    #ProjectModule.delete_all
    ProjectOwner.delete_all
    ProjectOwnerField.delete_all
    ProjectOwnerImage.delete_all
    ProjectOwnership.delete_all
    ProjectStat.delete_all

    results = RestClient.get(@@url)

    results = JSON.parse results

    # Checking to make sure we have some data returned from Behance
    if results['projects'].present?
      results['projects'].each do |project|      
        # Here we find the project, and if we can't find it we create it        
        created_project = Project.find_or_create_by(behance_id: project['id'])

        project_details = RestClient.get("http://www.behance.net/v2/projects/#{project['id']}?api_key=#{@@behance_api_key}")

        project_details = JSON.parse project_details


        created_project.update_attributes(
          name: project['name'],
          description: project_details["project"]["description"],
          published_on: project['published_on'],
          created_on: project['created_on'],
          modified_on: project['modified_on'],
          url: project['url'],
          privacy: project['privacy'],
          for_sale: project['for_sale']
        )

        #ProjectModule.where(project_id: created_project.id).delete_all
        # if project was just created        

        if old_projects.values.include?(project['id'])
          # Since we recreatedthe projects we have to update the project modules with their respective project ids
          old_project_id = old_projects.find{|k, v| old_projects[k] == project['id'] }.first

          project_module = ProjectModule.find_by(project_id: old_project_id)
          
          if project_module          
            project_module.project_id = created_project.id
            
            project_module.save
          end                    
        else
          pm = ProjectModule.create(project_id: created_project.id)

          pm.content = pm.content || ""
          
          
          project_details["project"]["modules"].each do |project_module|
            puts "module looped through"
            if project_module["type"] == "image"
              pm.content += "<img src='#{project_module['src']}'></img>"
            elsif project_module["type"] == "text"          
              pm.content += project_module["text_plain"]
            end

            pm.save
          end
        end
                 




        # Here we save the project fields
        project['fields'].each do |field|
          field = Field.find_or_create_by(name: field)

          ProjectField.find_or_create_by(project_id: created_project.id, field_id: field.id)
        end

        # Because you may have removed some project fields, we will have to delete any ones
        # that no longer exist
        fields_to_be_removed = ProjectField.where(project_id: created_project.id).map(&:field).map(&:name) - project['fields']

        # We remove any fields that no longer exist in the Behance Project
        fields_to_be_removed.each do |field_name|
          field_record = Field.where(name: field_name).first

          ProjectField.where(project_id: created_project.id, field_id: field_record.id).first.delete
        end

        # Here we save the project covers
        project['covers'].each do |cover_key, url|
          if /orig/.match url
            ProjectCover.find_or_create_by(project_id: created_project.id, url: url)
          end
        end

        # Here we remove any project covers that no longer exist in the Behance project
        covered_to_be_removed = ProjectCover.where(project_id: created_project.id).pluck(:url) - project['covers'].values

        covered_to_be_removed.each do |removed_cover_url|
          ProjectCover.where(project_id: created_project.id, url: removed_cover_url).first.delete
        end

        # Here we save/update the Project Owners for the project
        project['owners'].each do |owner|
          project_owner = ProjectOwner.find_or_create_by(behance_id: owner['id'])

          project_owner.update_attributes(
            first_name: owner['first_name'],
            last_name: owner['last_name'],
            username: owner['username'],
            city: owner['city'],
            state: owner['state'],
            country: owner['country'],
            company: owner['company'],
            url: owner['url']
          )

          ProjectOwnership.create(project_owner_id: project_owner.id, project_id: created_project.id)

          # Here we save/update the Project Owner Images
          owner['images'].each do |key, image_url|
            ProjectOwnerImage.find_or_create_by(
                project_owner_id: project_owner.id,
                url: image_url
          )
          end

          # Here we remove any project owner images that have been removed from the Behance user account
          owner_images_to_be_removed = ProjectOwnerImage.where(project_owner_id: project_owner.id).pluck(:url) - owner['images'].values

          owner_images_to_be_removed.each do |removed_owner_image_url|
            ProjectOwnerImage.where(project_owner_id: project_owner.id, url: removed_owner_image_url).first.delete
          end

          # Here we save/update the Project Owner Fields
          owner['fields'].each do |field|
            field = Field.find_or_create_by(name: field)

            ProjectOwnerField.find_or_create_by(
                project_owner_id: project_owner.id,
                field_id: field.id
            )
          end

          # Here we remove any project owner fields that have been removed from the behance user account
          owner_fields_to_be_removed = ProjectOwnerField.where(project_owner_id: project_owner.id).map(&:field).map(&:name) - owner['fields']

          owner_fields_to_be_removed.each do |removed_owner_field_name|
            field_found = Field.where(name: removed_owner_field_name).first

            ProjectOwnerField.where(project_owner_id: project_owner.id, field_id: field_found.id).first.delete
          end
        end

        # Here we save/update the Project Stats
        project_stat = ProjectStat.find_or_create_by( project_id: created_project.id )

        project_stat.update_attributes(
            appreciation: project['stats']['appreciations'],
            comments: project['stats']['comments']
        )
      end
    end

    behance_ids = old_projects.values

    Project.all.select(:behance_id, :id).each do |project|
      puts " PROJECT BEHANCE ID #{project.behance_id}"    
    
    
      unless behance_ids.include?(project.behance_id)
        project_module = ProjectModule.find_by(project_id: project.id)
        
        project_module.delete        
        
        puts " DELETED " * 200
        project.delete
      end
    end

    return true
  end
end


