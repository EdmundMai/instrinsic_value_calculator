require 'sinatra'

set :public_folder, 'views'

get '/' do
  send_file File.join(settings.public_folder, 'here.html')
end

get '/evaluate/:ticker_symbol' do
  "ticker symbol = #{params[:ticker_symbol]}"
end