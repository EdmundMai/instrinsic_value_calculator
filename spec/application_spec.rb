require 'spec_helper'
require 'rack/test'

describe 'main application' do
  include Rack::Test::Methods

  def app
    Sinatra::Application.new
  end

  describe "/evaluate/*" do

    it "returns an ok response" do 
      get '/evaluate/amzn'
      last_response.should be_ok
    end

    it "returns symbol" do 
      get '/evaluate/amzn'
      parsed_body = JSON.parse(last_response.body)
      parsed_body['symbol'].should eq('amzn')
    end

    it "returns current price" do 
      get '/evaluate/amzn'
      parsed_body = JSON.parse(last_response.body)
      parsed_body['price'].should_not be_nil
    end

    it "returns current book value" do 
      get '/evaluate/amzn'
      parsed_body = JSON.parse(last_response.body)
      parsed_body['book_value'].should_not be_nil
    end

  end





end