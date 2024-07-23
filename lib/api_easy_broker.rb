require 'rest-client'
require 'json'
require 'dotenv/load'
api_url=ENV['API_URL']
api_token=ENV['API_TOKEN']
class ApiEasyBroker 
  def self.get(url, token)
    200
  end
end
if __FILE__ == $0
  puts ApiEasyBroker.get(api_url, api_token)
end
