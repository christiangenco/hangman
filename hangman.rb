class HangmanGame

  attr_reader :game_word, :game_letters, :guessed_letters, :turns

  def initialize
    @game_over = false
    @guessed_letters = []
    @turns = 7
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
      puts "Mwahaha, the superior computer remains superior"
      puts "The word was obviously #{@game_word}"
    end

  end

  def won?
    (@game_letters - @guessed_letters).length == 0
  end

  def to_s
    output = ""
    @game_letters.each do |l|
      if @guessed_letters.include? l
        output << "#{l} "
      else
        output << "__ "
      end
    end
    output
  end

  def random_word
    # downside: reads the entire text file into memory each time this method is called
    File.readlines(File.join('dictionaries', 'gsl.txt')).sample.strip
  end

end

HangmanGame.new.play
