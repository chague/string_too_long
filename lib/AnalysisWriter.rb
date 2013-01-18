require "csv"

class AnalysisWriter

  attr_reader :strings

  @@FILE = "../bin/analysis.txt"
  @@FILE_OPTION_WRITE = "w"
  
  def initialize(strings)
    @strings = strings
  end

  def writeFile
    begin
      CSV.open(@@FILE, @@FILE_OPTION_WRITE) do |f|
        for line in @strings
          for sing in line
            f << sing
          end
        end
      end
    rescue
      CSV.new(@@FILE, @@FILE_OPTION_WRITE)
      retry
    end
  end

end