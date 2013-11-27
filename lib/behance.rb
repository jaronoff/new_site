class Behance

  @@url = "http://www.behance.net/v2/users/matiascorea/projects?api_key=#{ENV['BEHANCE_API']}"
  def self.get_projects
    results = RestClient.get(@@url)

    puts results
  end
end