require 'spec_helper'

describe DataRetriever do

  describe "#current_data" do
    it 'does not raise error' do
      DataRetriever.current_data('amzn').should_not raise_error
    end
  end
  
  describe "#historical_data" do
    it 'does not raise error' do
      DataRetriever.historical_data('amzn').should_not raise_error
    end
  end

end