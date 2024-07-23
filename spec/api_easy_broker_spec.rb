require 'dotenv/load'
require 'api_easy_broker'
require 'rspec'
api_url=ENV['API_URL']
api_token=ENV['API_TOKEN']
RSpec.describe ApiEasyBroker do
    it 'should return 200 status code' do
      response = ApiEasyBroker.get(api_url, api_token)
      expect(response).to eq(200)
  end
end