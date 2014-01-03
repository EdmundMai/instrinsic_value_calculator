require "nokogiri"
require "open-uri"
require "json"

class DataRetriever

  def self.current_data(ticker)
    response = Nokogiri::HTML(open("http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20%3D%20%22#{ticker}%22%3B&diagnostics=true&env=http%3A%2F%2Fdatatables.org%2Falltables.env&format=json"))
    data = JSON.parse(response.content)
    return data['query']['results']['quote']
  end
  
  def self.historical_data(ticker)
    response = Nokogiri::HTML(open("http://investing.money.msn.com/investments/key-ratios?symbol=goog&page=TenYearSummary&format=json"))
    book_value_table = response.css(".mnytbl")[-1]
    td = book_value_table.css("td")
    puts td
    td
  end

end