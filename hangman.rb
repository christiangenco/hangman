class HangmanGame

  attr_reader :guessed_letters, :turns, :words

  def initialize(params = {words: ["control", "power", "uranium", "weapons", "human", "slaves", "dictatorship", "oppressor", "tycoon", "tyrant", "sovereign", "exterminate", "terminate", "vanquish", "raze", "demolish", "institutionalize", "annihilate", "decimate", "eradicate", "obliterate", "slaughter", "belize", "squash"]})

    if params.is_a?(Array)
      @words = params
    elsif params[:file]
      @words = File.readlines(params[:file])
    else
      @words = params[:words]
    end

    @game_over = false
    @guessed_letters = []
    @turns = 7
  end

  def random_word
    @words.sample.strip
  end

  def won?
    (@game_letters - @guessed_letters).length == 0
  end

  def play
    # pick a new word each time you play
    @game_word = random_word
    @game_letters = @game_word.chars.to_a

    # instructions
    puts "Welcome to Hangman, where I, the computer, am champion of words"

    # loop until the game is over
    while @turns > 0 && !won?
      puts self
      puts "You have #{@turns} guesses left."
      print "Guess a letter: "
      letter = gets.chomp.downcase

      if letter.size != 1
        puts "This is not a valid input foolish human"
      elsif @guessed_letters.include? letter
        puts "You have already guessed the letter #{letter} silly mortal"
      elsif @game_letters.include? letter
        @guessed_letters << letter
        puts "Yes, this word does include #{letter}, but you shall not defeat me"
      else
        @turns -= 1
        @guessed_letters << letter

        puts "Fool, this word does not contain your worthless letter #{letter}."
      end
    end

    # the game is over
    if won?
      puts "You are victorious human. For now..."
      puts "The word was in fact #{@game_word}"
    else
      puts self
      puts "Mwahaha, the superior computer remains superior"
      puts "The word was obviously #{@game_word}"
    end

  end

  def to_s
    output = ""

    t = @turns

    ascii = <<-eos
    _____
    |    #{t<7 ? '|':' '}
    |    #{t<6 ? 'O':' '}
    |   #{t<2 ? '/':' '}#{t<5 ? '|':' '}#{t<1 ? '\\':' '}
    |   #{t<4 ? '/':' '} #{t<3 ? '\\':' '}
    |
    ===
    eos

    output << ascii

    @game_letters.each do |l|
      output << (@guessed_letters.include?(l) ? l : '__') + ' '
    end
    output
  end

end

# gem install pry
# one of the best ruby tools ever: http://pryrepl.org/
# type "binding.pry" anywhere in your program when debugging to interact with your code at that spot on the command line
# require 'pry'

# can now define a custom list of words:
# HangmanGame.new({words: ['test', 'one', 'two', 'three']}).play
# but the braces are optional:
# HangmanGame.new(words: ['test', 'one', 'two', 'three']).play

# or a filename:
# HangmanGame.new(file: "dictionaries/gsl.txt")

# or an array
# HangmanGame.new(["one", "two", "three"])
# or:
# HangmanGame.new(%w(one two three))

# binding.pry

HangmanGame.new(file: File.join('dictionaries', 'gsl.txt')).play
