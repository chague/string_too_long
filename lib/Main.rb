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
    timeStamp = Time.now.getutc.to_s
    wrt = AnalysisWriter.new(@retStrings, ("../bin/output_reports/"+timeStamp+"/"))
    wrt.writeFile
    printAnalysis(@retStrings)
    puts "\nFiles containing the analysis has been placed here: "
    puts File.expand_path("../bin/output_reports/#{timeStamp}")
  end
  
  def printAnalysis(strings)
    invalids = Array.new
    for s in strings
      inputs = s.split(", ")
      if(inputs[3] != nil)
        invalids << inputs
      end
    end
    puts "Out of #{strings.size} strings, #{invalids.size} were invalid: "
    for i in invalids
      puts "- #{i[2]}"
    end
  end
  
  
  
  
end

m = Main.new
m.getInputs
