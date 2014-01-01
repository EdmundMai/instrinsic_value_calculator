require 'spec_helper'

describe Stock do

  describe "#initialize" do
    it 'sets the name' do 
      stock = Stock.new(name: 'amzn')
      stock.name.should eq('amzn')
    end
  end

  describe "#update_attributes" do
    let(:stock) { Stock.new(name: 'amzn') }
    it 'sets the current_price' do
      data = {"Ask"=>11.22}
      stock.update_attributes(data)
      stock.current_price.should == 11.22
    end

    it 'sets the current_price' do
      data = {"BookValue"=>22.33}
      stock.update_attributes(data)
      stock.current_book_value.should == 22.33
    end
  end

end