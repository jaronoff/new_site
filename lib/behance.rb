class Behance
  @@behance_api_key =  'JozfVr61PLTbJ7obHSpNtRInKImNO5Ur'

  @@behance_id = 'josharonoff'

  @@url = "http://www.behance.net/v2/users/#{@@behance_id}/projects?api_key=#{@@behance_api_key}"

  def self.get_projects
    results = RestClient.get(@@url)

    return JSON.parse results
  end
end
