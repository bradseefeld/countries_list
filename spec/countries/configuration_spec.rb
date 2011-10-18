require "spec_helper"

describe Countries::Configuration do
  
  it "defaults to en locale" do
    config = Countries::Configuration.new
    config.locale.should == :en
  end
  
  it "accepts setters" do
    config = Countries::Configuration.new
    config.locale = :fr
    config.priority = [:us, :ca]
    
    config.locale.should == :fr
    config.priority.length.should == 2
  end
  
  it "provides a file path based on locale" do
    config = Countries::Configuration.new
    config.file_path.should =~ /#{config.locale}\.yml/
  end
end