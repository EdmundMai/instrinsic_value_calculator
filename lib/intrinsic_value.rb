require 'sinatra'

get '/' do
  "hello world!"
end

get '/evaluate/:ticker_symbol' do
  "ticker symbol = #{params[:ticker_symbol]}"
end