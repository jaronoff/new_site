class Behance
  @@behance_api_key =  'JozfVr61PLTbJ7obHSpNtRInKImNO5Ur'

  @@behance_id = 'josharonoff'

  @@url = "http://www.behance.net/v2/users/#{@@behance_id}/projects?api_key=#{@@behance_api_key}"

  def self.get_projects
    results = RestClient.get(@@url)

    results = JSON.parse results

    results['projects'].each do |project|

      # Here we find the project, and if we can't find it we create it
      created_project = Project.find_or_create_by(behance_id: project['id'])

      created_project.update_attributes(
        name: project['name'],
        published_on: project['published_on'],
        created_on: project['created_on'],
        modified_on: project['modified_on'],
        url: project['url'],
        privacy: project['privacy'],
        for_sale: project['for_sale']
      )

      # Here we save the project fields
      project['fields'].each do |field|
        field = Field.find_or_create_by(name: field)

        ProjectField.create(project_id: created_project.id, field_id: field.id)
      end

      # Here we save the project covers
      project['covers'].each do |cover_key, url|
        ProjectCover.create(project_id: created_project.id, url: url)
      end

      # Here we save the Project Owners for the project
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

        # Here we save the Project Owner Images
        owner['images'].each do |key, image_url|
          ProjectOwnerImage.find_or_create_by(
              project_owner_id: project_owner.id,
              url: image_url
          )
        end

        # Here we save the Project Owner Fields
        owner['fields'].each do |field|
          field = Field.find_or_create_by(name: field)

          ProjectOwnerField.find_or_create_by(
              project_owner_id: project_owner.id,
              field_id: field.id
          )
        end
      end

      # Here we save the Project Stats
      ProjectStat.find_or_create_by(
          project_id: created_project.id,
          appreciation: project['stats']['appreciations'],
          comments: project['stats']['comments']
      )
    end

    return true
  end
end

{"id"=>11939065,
 "name"=>"Translational Research and Clinical Practice Book Cover",
 "published_on"=>1383685855,
 "created_on"=>1383684852,
 "modified_on"=>1383685855,
 "url"=>"http://www.behance.net/gallery/Translational-Research-and-Clinical-Practice-Book-Cover/11939065",
 "privacy"=>"public",
 "fields"=>["Art Direction", "Graphic Design", "Icon Design"],
 "covers"=>{"115"=>"http://behance.vo.llnwd.net/profiles3/115734/projects/11939065/115x7567b956aac426ff67e53f95c9cd53c2.jpeg",
            "202"=>"http://behance.vo.llnwd.net/profiles3/115734/projects/11939065/7567b956aac426ff67e53f95c9cd53c2.jpeg",
            "404"=>"http://behance.vo.llnwd.net/profiles3/115734/projects/11939065/404x7567b956aac426ff67e53f95c9cd53c2.jpeg",
            "230"=>"http://behance.vo.llnwd.net/profiles3/115734/projects/11939065/230x7567b956aac426ff67e53f95c9cd53c2.jpeg"},
 "owners"=>[{"id"=>115734,
             "first_name"=>"Josh",
             "last_name"=>"Aronoff",
             "username"=>"josharonoff",
             "city"=>"Pittsburgh",
             "state"=>"Pennsylvania",
             "country"=>"United States",
             "company"=>"Aronoff Creative",
             "url"=>"http://www.behance.net/josharonoff",
             "images"=>{"50"=>"http://behance.vo.llnwd.net/profiles3/115734/50x577571c06b4dd76ecc83e2fa8d33b129.png",
                        "115"=>"http://behance.vo.llnwd.net/profiles3/115734/115x577571c06b4dd76ecc83e2fa8d33b129.png",
                        "138"=>"http://behance.vo.llnwd.net/profiles3/115734/577571c06b4dd76ecc83e2fa8d33b129.png"},
             "fields"=>["UI/UX", "Web Design", "Graphic Design"]}],
 "stats"=>{
     "appreciations"=>2,
     "comments"=>0},
 "for_sale"=>0
}
