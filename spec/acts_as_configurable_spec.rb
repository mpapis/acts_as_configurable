require File.join(File.dirname(__FILE__), 'spec_helper')

describe "ActsAsConfigurable" do
  it "should respond to 'configuration'" do
    Settings1.configuration.should_not be_nil
  end
  it "should contain default values" do
    Settings1 .configuration[:first].should eql '1st'
  end
  it "should contain values" do
    Settings2.configuration[:first].should eql "2nd"
  end
  it "should contain values for string" do
    Settings30.configuration[:first].should eql "3rd"
  end
  it "should contain values for symbol" do
    Settings31.configuration[:first].should eql "3rd"
  end
  it "should contain values for class" do
    Settings4.configuration[:first].should eql "2nd"
  end
  it "should contain values for object" do
    Settings2.new.configuration[:first].should eql "2nd"
  end
  it "should respond to 'conf' - passed as string" do
    Settings50 .conf[:first].should eql '1st'
  end
  it "should respond to 'conf' - passed as symbol" do
    Settings51 .conf[:first].should eql '1st'
  end
  it "should respond to 'conf' - passed as :name=>" do
    Settings52 .conf[:first].should eql '3rd'
  end
  it "should respond to 'conf' - passed as :name=>symbol" do
    Settings53 .conf[:first].should eql '3rd'
  end
  it "should work with other default - passed as string" do
    Settings60 .conf[:first].should eql '3rd'
  end
  it "should work with other default - passed as symbol" do
    Settings61 .conf[:first].should eql '3rd'
  end
  it "should work with other default but also exisitng for" do
    Settings7 .conf[:first].should eql '2nd'
  end
  it "should work with multiple definitions" do
    Settings8 .conf1[:first].should eql '1st'
    Settings8 .conf2[:first].should eql '2nd'
  end
end