require 'rest-client'
require 'json'
require 'dotenv/load'
api_url=ENV['API_URL']
api_token=ENV['API_TOKEN']
class ApiEasyBroker 
  def self.get(url, token)
    response = RestClient.get(url, {'X-Authorization': token})
    JSON.parse(response)
    response.code
  end
end
if __FILE__ == $0
  puts ApiEasyBroker.get(api_url, api_token)
end
