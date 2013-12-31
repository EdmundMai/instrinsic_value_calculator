require "nokogiri"
require "open-uri"
require "json"

class DataRetriever

  def retrieve_data(ticker)
    response = Nokogiri::HTML(open("http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20%3D%20%22#{ticker}%22%3B&diagnostics=true&env=http%3A%2F%2Fdatatables.org%2Falltables.env&format=json"))
    data = JSON.parse(response.content)
    puts data['query']['results']['quote']
    return data['query']['results']['quote']
  end

end