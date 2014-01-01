class Stock
  attr_reader :name, :current_price, :current_book_value
  def initialize(args={})
    @name = args[:name]
  end

  def update_attributes(data)
    @current_price = data["Ask"]
    @current_book_value = data["BookValue"]
  end

end