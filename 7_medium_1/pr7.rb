# First attempt

=begin
- Update solution to accept a low and high value when creating an instance of GuessingGame
- Change the number of guesses allowed so the user can always win if she uses a good strategy
=end

class GuessingGame
  attr_accessor :player_guess, :total_guesses, :target_number, :min, :max
  
  def initialize(min = 1, max = 100)
    @min = min
    @max = max
    @target_number = random_number
    @total_guesses = max_guesses
  end
  
  def play
    main_game
    game_result
    reset_game
  end
  
  private
  
  def main_game
    loop do
      display_remaining_guesses
      ask_player_to_guess
      display_result
      break if player_guessed_right?
      self.total_guesses -= 1
      break if total_guesses <= 0
    end
  end
  
  def game_result
    player_guessed_right? ? display_player_won : display_player_lost
  end
  
  def display_remaining_guesses
    puts ""
    if total_guesses == 1
      puts "You have 1 guess remaining"
    else
      puts "You have #{total_guesses} guesses remaining."
    end
  end
  
  def ask_player_to_guess
    puts "Enter a number between #{min} and #{max}: "
    answer = nil
    
    loop do
      answer = gets.chomp
      break if (min..max).include? answer.to_i
      puts "Invalid guess. Enter a number between #{min} and #{max}"
    end
    
    self.player_guess = answer.to_i
  end
  
  def display_result
    if player_guess > target_number
      puts "Your guess is too high."
    elsif player_guess < target_number
      puts "Your guess is too low."
    else
      puts "That's the number!"
    end
  end
  
  def player_guessed_right?
    target_number == player_guess
  end
  
  def display_player_lost
    puts ""
    puts "You have no more guesses. You lost!"
  end
  
  def display_player_won
    puts ""
    puts "You won!"
  end
  
  def reset_game
    self.target_number = random_number
    self.total_guesses = max_guesses
  end
  
  def random_number
    rand(@min..@max)
  end
  
  def max_guesses
    Math.log2(size_of_range).to_i + 1
  end
  
  def size_of_range
    (min..max).to_a.size
  end
  
end

game = GuessingGame.new
game.play
