class StringReader
  private

  @@readFromPrompt = "Read from? \n1. File\n2. Console"
  @@choiceInt = 1
  @@fileNamePrompt = "What is the full path of the file for example try (../lib/test.txt)?"
  @@readFromConsoleInstructions = "To input the strings manually, simply type each string followed by return. When you are finished, type 'done' then press return to halt execution..."
  @@endConsoleReadWord = "done"

  public
  def initialize
    @hands = Array.new
  end

  def readStrings
    puts @@readFromPrompt
    choice = gets.chomp.to_i
    retStrings = ""
    retStrings = readFromFile if choice == @@choiceInt
    retStrings = readFromConsole if choice == (@@choiceInt + 1)
    return retStrings
  end

  private

  def readFromFile
    puts @@fileNamePrompt
    begin
      fileName = gets.chomp
      allString = Array.new
      tempFile = File.open(fileName).each_line { |s|
        allString << s
      }
    rescue
      puts "File Not Found, please try again..."
    retry
    end
    return allString
  end

  def readFromConsole
    puts @@readFromConsoleInstructions
    allString = Array.new
    input = gets.chomp
    while(input != @@endConsoleReadWord)
      allString << input
      input = gets.chomp
    end
    return allString
  end

end