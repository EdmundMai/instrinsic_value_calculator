require 'sinatra'
require 'json'

require File.join(File.dirname(__FILE__), '/lib/data_retriever')

set :public_folder, 'views'

get '/evaluate/:ticker_symbol' do
  content_type :json
  data_retriever = DataRetriever.new
  data = data_retriever.retrieve_data(params[:ticker_symbol])
  price = data['Ask']
  { symbol: params[:ticker_symbol], price: price }.to_json
end