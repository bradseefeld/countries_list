require "spec_helper"

describe CountriesList do
  
  context "find all" do
    it "provides a full list of countries" do
      CountriesList.all.length.should >= 200
    end
  end
  
  context "find_by_code" do
    it "finds a specific country by symbol" do
      country = CountriesList.find_by_code(:us)
      country[:name].should == "United States"
      country[:code].should == "US"
    end
    
    it "finds a specific country using string" do
      country = CountriesList.find_by_code("US")
      country[:name].should == "United States"
      country[:code].should == "US"
    end
    
    it "ignores case" do
      country = CountriesList.find_by_code("Ca")
      country[:name].should == "Canada"
      country[:code].should == "CA"
    end
  end
end