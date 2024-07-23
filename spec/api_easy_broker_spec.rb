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

  it 'should return a list of 50 titles' do
    titles = ApiEasyBroker.get_titles
    expect(titles).to be_an(Array)
    expect(titles.size).to be > 0
  end

end