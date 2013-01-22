require "rspec"
require "../lib/StringAnalyzer"

describe StringAnalyzer, "Analyzing Strings" do
  before(:each) do
    @stringAn = StringAnalyzer.new
    @test_strings = ["test", "test longer", "test the longest string"]
    @test_limit = 12
    @test_result0 = "4, 12, test"
    @test_result1 = "11, 12, test longer"
    @test_result2 = "23, 12, test the longest string, !String too long!"
    
  end
   it "should provide information about a string and determine whether or not it is too long" do
     result = @stringAn.analyzeStrings(@test_strings, @test_limit)
     result[0].should == @test_result0
     result[1].should == @test_result1
     result[2].should == @test_result2
     
   end 
end
