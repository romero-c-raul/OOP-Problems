# First attempt

=begin
- Create an object-oriented number guessing class for numbers in the range 1 to 100, 
  with a limit of 7 guesses per game. 
  
- Number Guesser game has the computer select a random number between 1 and 100,
  and the player must guess that number
    - If the player's guess is above the number, he will be informed the guess
      is too high
    - If the player's guess is below the number, he will be informed the guess
      is too low
    - The player only gets 7 guesses per game
=end

class GuessingGame
  MAX_GUESSES = 7
  
  attr_accessor :player_guess, :total_guesses, :target_number
  
  def initialize
    @target_number = random_number
    @total_guesses = MAX_GUESSES
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
    puts "Enter a number between 1 and 100: "
    answer = nil
    
    loop do
      answer = gets.chomp
      break if (1..100).include? answer.to_i
      puts "Invalid guess. Enter a number between 1 and 100"
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
    self.total_guesses = 7
  end
  
  def random_number
    (1..100).to_a.sample
  end
  
end

game = GuessingGame.new
game.play
game.play