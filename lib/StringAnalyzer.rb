require_relative "StringTooLongException"

class StringAnalyzer
  def analyzeStrings(strings, lLimit)
    retStrings = Array.new
    for c in strings
      temp = "#{c.size}, #{lLimit}, #{c}"
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