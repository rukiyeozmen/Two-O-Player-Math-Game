class Game
  attr_reader :current_player_index

  def initialize
    @current_player_index = 0
  end

  def switch_turn
    @current_player_index = (@current_player_index + 1) % 2
  end

  def start(player1, player2, question)
    # Assign the initial current player
    @current_player_index = 0
  
    # Game loop
    loop do
      puts "----- NEW TURN -----"
  
      # Generate a new question
      question.generate
  
      # Ask the current player the question
      current_player = (@current_player_index == 0) ? player1 : player2
      puts "#{current_player.name}: #{question.question}"
      print "> "
      answer = gets.chomp.to_i
  
      # Check if the answer is correct
      if answer == question.answer
        puts "#{current_player.name}: YES! You are correct."
      else
        puts "#{current_player.name}: Seriously? No!"
        current_player.lose_life
      end
  
      # Print the current scores
      puts "#{player1.name}: #{player1.score} vs #{player2.name}: #{player2.score}"
  
      # Check if the game is over
      if player1.lives == 0 || player2.lives == 0
        announce_winner(player1, player2)
        break
      end
  
      # Switch the current player for the next turn
      switch_turn
    end
  
    puts "----- GAME OVER -----"
    puts "Goodbye!"
  end
  
  

  private

  def announce_winner(player1, player2)
    winner = player1.lives == 0 ? player2 : player1
    loser = player1.lives == 0 ? player1 : player2

    puts "#{winner.name} wins with a score of #{winner.score}/#{Player::MAX_LIVES}"
    puts "#{loser.name}: #{loser.score}/#{Player::MAX_LIVES}"
  end
end
