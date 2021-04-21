# 1. Pick a random hand (rock, paper, scissors) for the opponent
# 2. Ask the user to pick a hand
# 3. Check that user input is a valid option, if not keep asking them to choose a correct choice
# 4. Compare the user choice to their opponent
# 5. Display who the winner is and exit

choices = %w(rock paper scissors)
# p choices[rand(0..2)]
# p choices.sample

running = true

# Counts the number of times the user has won
counter = 0

# Start the loop
while running

  opponent_choice = choices.sample
  user_choice = nil

  # Start the loop and only stop when the user input is a valid option
  loop do
    puts "Choose your hand: paper | rock | scissors"
    print "> "
    user_choice = gets.chomp

    if choices.include?(user_choice)
      break
    else
      puts "Wrong choice...."
    end
  end

  # Compare choices
  if user_choice == opponent_choice
    puts "It's a draw! Opponent chose #{opponent_choice}!"
  else
    # if opponent_choice == 'paper'
    #   # if user_choice == 'rock'
    #   #   puts "You lose!"
    #   # else
    #   #   puts "You win!"
    #   # end
    #   player_wins = user_choice == 'scissors'
    # end
    # if opponent_choice == 'scissors'
    #   player_wins = user_choice == 'rock'
    # end
    # if opponent_choice == 'rock'
    #   player_wins = user_choice == 'paper'
    # end

    # Refactored code for above
    case opponent_choice
      when 'paper' then player_wins = user_choice == 'scissors'
      when 'scissors' then player_wins = user_choice == 'rock'
      when 'rock' then player_wins = user_choice == 'paper'
    end

    # Puts outcome of the game
    if player_wins
      counter += 1
      puts "You win! Opponent chose #{opponent_choice}!"
      puts "Your score: #{counter}"
    else
      puts "You lose! Opponent chose #{opponent_choice}!"
    end
  end

  # Ask user if they want to continue playing the game
  puts "Do you want to play another round? Enter: y/n"
  print "> "
  answer = gets.chomp

  if answer == 'n'
    running = false
  end
end
