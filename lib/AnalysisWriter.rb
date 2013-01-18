require "csv"
require "pry"

class AnalysisWriter

  attr_reader :strings

  @@FILE = "ValidStrings.log"
  @@FILE_FAIL = "InvalidStrings.log"
  @@FILE_OPTION_WRITE = "a"
  @@SPLIT_CHAR = ", "
  @@DEFAULT_OPTIONS = { :col_sep => ",",
                    :row_sep => :auto,
                    :quote_char => '"',
                    :converters => nil,
                    :unconverted_fields => nil,
                    :headers => @headers,
                    :return_headers => false,
                    :header_converters => nil,
                    :skip_blanks => false,
                    :force_quotes => false }
  
  
  
  def initialize(strings, dir)
    @directory = dir
    Dir::mkdir(@directory)
    @strings = strings
    @file = dir + @@FILE
    @file_fail = dir + @@FILE_FAIL
    @headers = ["String Size", "Max String Size", "String", "Error Message"]
  end

  def writeFile

    unless (File.exists?(@file))
      CSV.open(@file, @@FILE_OPTION_WRITE) do |f|
        f << @headers
      end 
      
    end
    
    CSV.open(@file, @@FILE_OPTION_WRITE) do |f|
        for line in @strings
          inputs = line.split(@@SPLIT_CHAR)
          if(inputs[3] == nil)
            f << inputs
          else
            writeFail(inputs)
          end
        end
    end

  end
  
  def writeFail(strings)
    unless (File.file?(@file_fail))
      CSV.open(@file_fail, @@FILE_OPTION_WRITE) do |f|
        f << @headers
      end
    end
    
      CSV.open(@file_fail, @@FILE_OPTION_WRITE) do |f|
        f << strings
      end
   
  end
  
  

end