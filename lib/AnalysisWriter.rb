
class AnalysisWriter

  attr_reader :strings

  @@FILE = "../bin/analysis.txt"
  @@FILE_OPTION_WRITE = "w"
  
  def initialize(strings)
    @strings = strings
  end

  def writeFile
    begin
      File.open(@@FILE, @@FILE_OPTION_WRITE) do |f|
        for s in @strings
          f.write(s + "\n")
        end
      end
    rescue
      File.new(@@FILE, @@FILE_OPTION_WRITE)
      retry
    end
  end

end