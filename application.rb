require 'sinatra'
require 'json'

require File.join(File.dirname(__FILE__), '/lib/data_retriever')
require File.join(File.dirname(__FILE__), '/lib/stock')

get '/evaluate/:ticker_symbol' do
  content_type :json
  stock = Stock.new(name: params[:ticker_symbol])
  data = DataRetriever.current_data(stock.name)
  historical = DataRetriever.historical_data(stock.name)
  stock.update_attributes(data)
  
  { symbol: params[:ticker_symbol], price: stock.current_price, book_value: stock.current_book_value, historical_data: historical.inspect }.to_json
end