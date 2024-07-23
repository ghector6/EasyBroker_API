require 'rest-client'
require 'json'
require 'dotenv/load'

class ApiEasyBroker
  @api_url = ENV['API_URL']
  @api_token = ENV['API_TOKEN']
  @headers = {
    'X-Authorization': @api_token,
    'Country-Code': 'MX',
    'Accept': 'application/json'
  }

  def self.get(endpoint)
    response = RestClient.get("#{@api_url}#{endpoint}", @headers)
    JSON.parse(response.body)
  rescue RestClient::ExceptionWithResponse => e
    puts "An error occurred: #{e.response}"
    nil
  end

  def self.get_titles
    response = get("/properties")
    return [] if response.nil?

    response['content'].map { |property| property['title'] }
  rescue => e
    puts "An error occurred: #{e.message}"
    []
  end
end

if __FILE__ == $0
  titles = ApiEasyBroker.get_titles
  if titles.empty?
    puts "No titles found or an error occurred."
  else
    puts titles
  end
end