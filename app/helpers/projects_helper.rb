module ProjectsHelper
  def to_kebab_case(string)
    string.split(' ').map {|word| word.downcase }.join('-')
  end

end
