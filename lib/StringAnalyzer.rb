require_relative "StringTooLongExceptions"

class StringAnalyzer
  def analyzeStrings(strings, lLimit)
    retStrings = Array.new
    for c in strings
      temp = "String Size: #{c.size}, Max Size: #{lLimit}, String: #{c}"
      begin
        raise StringTooLongException if c.size > lLimit
      rescue
        temp += ", !String too long!"
      end
      retStrings << temp
    end
    return retStrings
  end

end