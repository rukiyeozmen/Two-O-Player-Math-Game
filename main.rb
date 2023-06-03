require_relative 'game'
require_relative 'player'
require_relative 'question'

def start_game(game, player1, player2, current_player)
  loop do
    puts "----- NEW TURN -----"
    question = Question.new

    puts "#{current_player.name}: #{question.question}"
    answer = gets.chomp.to_i

    if answer == question.answer
      puts "#{current_player.name}: YES! You are correct."
    else
      puts "#{current_player.name}: Seriously? No!"
      current_player.lose_life
    end

    puts "P1: #{player1.score} vs P2: #{player2.score}"

    break if player1.score.to_i.zero? || player2.score.to_i.zero?

    game.switch_turn
    current_player = game.current_player
  end

  puts "----- GAME OVER -----"
  winner = player1.score.to_i.zero? ? player2 : player1
  puts "#{winner.name} wins with a score of #{winner.score}/3"
  puts "Goodbye!"
end

# Create instances of the Game, Player, and Question classes
game = Game.new
player1 = Player.new('Player 1')
player2 = Player.new('Player 2')
question = Question.new

def start_game(game, player1, player2, question)
  game.start(player1, player2, question)
end

# Start the game
start_game(game, player1, player2, question)
