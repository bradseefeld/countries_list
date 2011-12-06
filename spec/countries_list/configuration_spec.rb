require "spec_helper"

describe CountriesList::Configuration do
  
  it "defaults to en locale" do
    config = CountriesList::Configuration.new
    config.locale.should == :en
  end
  
  it "accepts setters" do
    config = CountriesList::Configuration.new
    config.locale = :fr
    config.priority = [:us, :ca]
    
    config.locale.should == :fr
    config.priority.length.should == 2
  end
  
  it "provides a file path based on locale" do
    config = CountriesList::Configuration.new
    config.file_path.should =~ /#{config.locale}\.yml/
  end
end