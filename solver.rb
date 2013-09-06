class HangmanSolver
	attr_reader :guessed_letters, :words
	
	def initialize(params = {length: nil}) 
		params.merge!({words: ["control", "power", "uranium", "weapons", "human", "slaves", "dictatorship", "oppressor", "tycoon", "tyrant", "sovereign", "exterminate", "terminate", "vanquish", "raze", "demolish", "institutionalize", "annihilate", "decimate", "eradicate", "obliterate", "slaughter", "belize", "squash"] })

		if params[:file]
			@words = File.readlines(params[:file])
			@words.each { |w| w.chomp! }
		else
			@words = params[:words]
		end
		
		@guesses = []
		@guessed_letters = []
		@wrong_letters = []
		@length = nil
		@word = Array.new
		set_length(params[:length]) if params[:length]
	end

	def set_length(length)
		@length = length.to_i
		raise "Invalid Length" if @length <= 0
		temp_words = Array.new
		@words.each { |w| temp_words.push w if w.length == length }
		@words = temp_words
		@word = Array.new(@length) { |l| l = "." }
	end

	def guess(letter, position = nil)
		#puts @words.join("   ")
		puts "Guesses: #{@guessed_letters.join(" ")}" if @guessed_letters.length > 0
		raise "Invalid Letter Entered" if letter.match(/[a-z]/).nil?
		letter = letter.match(/[a-z]/)[0]
		if @guessed_letters.include? letter
			puts "You have already guessed the letter #{letter}."
		else
			@guessed_letters << letter
			if(position.is_a?(Array))
				position.each do |p|
					p = p.to_i
					if(@word[p].nil? or @word[p] == ".")
						@word[p] = letter
					else
						raise "Invalid position #{p}. Already contains #{@word[p]}"
					end
				end
			elsif(position.nil? or @length.nil? or position >= @length)
				@wrong_letters << letter
			else
				position = position.to_i
				if(@word[position].nil? or @word[position] == ".")
                                        @word[position] = letter
                                else
                                        raise "Invalid position. Already contains #{@word[position]}"
                                end
			end
			temp_words = Array.new
			@words.each do |w|
				temp_words << w if(( @wrong_letters.length == 0 or (w =~ /#{@wrong_letters.join("|")}/).nil?) and (w =~ /#{@word.join("")}/) == 0)
			end
			@words = temp_words
		end
		temp_words
	end

	def help
		commons = {}
		@words.each do |word|
			letters = word.scan(/./).uniq
			letters.each do |l|
				next if @guessed_letters.include? l
				commons[l.to_sym] = 0 unless commons.has_key?(l.to_sym)
				commons[l.to_sym] += 1
			end
		end
		commons.sort_by {|k,v| v }
	end
end
