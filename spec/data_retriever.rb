require 'spec_helper'

describe DataRetriever do

  describe "#initialize" do
    it "is true " do 
      1.should be_true
    end


  end

  describe "#retrieve_data" do
    it 'queries Yahoo finance' do
      uri = URI('http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20%28%22amzn%22%29%0A%09%09&env=http%3A%2F%2Fdatatables.org%2Falltables.env&format=json')

      response = Net::HTTP.get(uri)

      expect(response).to be_an_instance_of(String)
    end
  end

end