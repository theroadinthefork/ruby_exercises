class Mastermind
  def initialize
    @guessesLeft = 12
    @validCodePattern = /\b[1-6]{4}\b/
    puts "Starting a new game of Mastermind!"
    loop do 
      puts "\nDo you want to be the code[m]aker or the code[b]reaker? m/b"
      gameMode = gets.chomp
      case gameMode
        when "b"
          @code = Array.new(4) {rand(1..6)}
        puts "\nYou've chosen to be the codebreaker. A code containing 4 digits been generated! Each digit is a number between 1 and 6. You have #{@guessesLeft} guesses. Good luck!"
          gameStateCodebreaker
          break
        when "m"
          puts "\nYou've chosen to be the codemaker. Enter a 4 digit code, where each digit must be between 1 and 6:"
        gameStateCodemaker
        else
          puts "Invalid input"
      end 
    end 
  end

  # Codemaker 
  def gameStateCodemaker
    # Get a valid code from user
    loop do
      newcode = gets.chomp
      if newcode.match(@validCodePattern)
        @code = newcode.chars.map(&:to_i)
        puts "\nGreat! Now the computer will start to guess."
        break
      else 
      puts "\nThe code must consist of 4 digits, and each digit must be between 1 and 6 inclusive. Try again:"
      end
    end
  
    # Start guessing
    guess = Array.new(4) {rand(1..6)}
    until @guessesLeft == 0
      puts "\nComputer guesses #{guess.join}"
      @guessesLeft -= 1
      correctDigits = []
      if guess == @code
          puts "\nComputer broke your code!"
          restart
        else
          guess.each_with_index{|x,i| x == @code[i] ? correctDigits << x : correctDigits << 0}
      end
      puts "#{@guessesLeft} guesses left"
      guess = correctDigits.map{|x| x == 0 ? x = rand(1..6) : x}
    end
    puts "\nComputer failed to break your code. You win!"
    restart
  end

  # Restart the game
  def restart
    puts "---GAME OVER---"
    puts "\nStart a new game? y/n"
    newGame = gets.chomp
    case newGame
      when 'y'
        initialize
      when 'n'
        puts "Thanks for playing! Exiting game"
    else
      puts "Not a valid input!"
    end 
  end

  # Codebreaker 
  def gameStateCodebreaker
    until @guessesLeft == 0
      
      puts "\nMake your guess:"
      guess = gets.chomp.chars.map(&:to_i)
      case 
        when guess == @code
          puts "\nCongrats! You broke the code."
          restart
        when guess.join.match(@validCodePattern).nil?
          puts "\nOops, your guess is invalid! Your guess must be a 4 digit code, where each digit is between 1 and 6."
        next
        else
          potentiallyMisplaced = []
          leftoverCode = []
        
          # Create list with incorrect digits
          guess.each_with_index do |x, i| 
            if x != @code[i]
              potentiallyMisplaced << x
              leftoverCode << @code[i]
            end
          end
          puts "\n#{4-potentiallyMisplaced.length} digit(s) are correct, and"

          # check for wrong spots
          wrong = 0
          potentiallyMisplaced.each do |x| 
            if leftoverCode.include? x
              wrong += 1
        leftoverCode.delete_at(leftoverCode.index(x))
            end
          end
          puts "#{wrong} digit(s) are in the wrong spot."
        end 
      @guessesLeft -= 1
      puts "#{@guessesLeft} guesses left."
    end 
    puts "\nToo bad! The code was #{@code.join}"
    restart
  end

end

game = Mastermind.new