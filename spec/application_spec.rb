require 'spec_helper'

describe 'main application' do
  include Rack::Test::Methods

  def app
    Sinatra::Application.new
  end

  specify 'shows the ticker symbol' do 
    get '/evaluate/amzn'
    last.response.should be_ok
  end
end