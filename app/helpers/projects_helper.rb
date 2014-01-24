module ProjectsHelper
  def to_kebab_case(string)
    string.split(' ').map { |word| word.downcase.gsub(/\W/, '') }.join('-')
  end

  def convert_fields_to_str(project)
    fields = []

    project.project_fields.each { |project_field| fields << project_field.field.name }

    return fields.join(', ')
  end
end
