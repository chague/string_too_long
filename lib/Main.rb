require_relative "StringReader"
require_relative "StringAnalyzer"
require_relative "AnalysisWriter"

class Main
  
  
  attr_accessor :allInputs
  
  def initialize
    @allInputs = ""
  end 
  
  def getInputs
    puts "Please enter the string length limit: "
    limit = gets.chomp.to_i
    sr = StringReader.new
    @allInputs = sr.readStrings
    analyze(limit)
  end 
  
  private
  
  def analyze(limit)
    ana = StringAnalyzer.new
    @retStrings = ana.analyzeStrings(@allInputs, limit)
    @retStrings.each {|c| puts c}
    wrt = AnalysisWriter.new(@retStrings)
    wrt.writeFile
    puts "A file containing the analysis has been placed here: "
    puts File.expand_path("../bin/analysis.txt")
  end
  
  
  
  
end

m = Main.new
m.getInputs
