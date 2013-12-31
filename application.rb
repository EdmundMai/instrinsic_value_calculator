require 'sinatra'
require 'json'

set :public_folder, 'views'

get '/evaluate/:ticker_symbol' do
  content_type :json
  { :symbol => params[:ticker_symbol] }.to_json
end