require 'dotenv/load'
require 'api_easy_broker'
require 'rspec'
api_url=ENV['API_URL']
RSpec.describe ApiEasyBroker do
    it 'should return non empty value ' do
      response = ApiEasyBroker.get(api_url)
      expect(response).not_to be_nil
  end

  it 'should return a list of 50 titles' do
    titles = ApiEasyBroker.get_titles
    expect(titles).to be_an(Array)
    expect(titles.size).to be > 0
  end

end