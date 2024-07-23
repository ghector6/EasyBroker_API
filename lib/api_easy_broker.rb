require 'rest-client'
require 'json'
require 'dotenv/load'

api_url = ENV['API_URL']
api_token = ENV['API_TOKEN']

class ApiEasyBroker
  def self.get(url, token)
    response = RestClient.get(url, {
      'X-Authorization': token,
      'Country-Code': 'MX',
      'accept': 'application/json'
    })
    JSON.parse(response)
    response.code
  end

  def self.get_titles
    response = RestClient.get("#{ENV['API_URL']}", {
      'X-Authorization': ENV['API_TOKEN'],
      'Country-Code': 'MX',
      'Accept': 'application/json'
    })
    json_response = JSON.parse(response.body)
    json_response['content'].map { |property| property['title'] } 
  rescue => e
    puts "An error occurred: #{e.message}"
    []
  end
end

if __FILE__ == $0
  puts ApiEasyBroker.get_titles
end