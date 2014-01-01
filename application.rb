require 'sinatra'
require 'json'

require File.join(File.dirname(__FILE__), '/lib/data_retriever')
require File.join(File.dirname(__FILE__), '/lib/stock')

get '/evaluate/:ticker_symbol' do
  content_type :json
  stock = Stock.new(name: params[:ticker_symbol])
  data_retriever = DataRetriever.new
  data = data_retriever.retrieve_data(stock.name)

  stock.update_attributes(data)
  
  { symbol: params[:ticker_symbol], price: stock.current_price, book_value: stock.current_book_value }.to_json
end