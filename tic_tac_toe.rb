board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "---+---+---"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "---+---+---"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Stores the winning combos
winning_combos = [
  # rows
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  # columns
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  # diagonal
  [0, 4, 8],
  [2, 4, 6]
]

# Player class
class Player
  attr_reader :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end

# Game class. Contains the methods for creating players and setting the board
class Game
  attr_reader :player_one, :player_two, :current_player

  def initialize
    @player_one = Player.new("Matt", "X") # eplace with nil when done
    @player_two = Player.new("Maria", "O") # replace with nil when done
    @current_player = player_one
  end

  def make_player(number)
    puts "Player #{number}, what is your name?"
    name = gets.chomp.capitalize
    puts "#{name}, what would you like your mark to be?"
    mark = gets.chomp.capitalize
    Player.new(name, mark)
  end

  # sets and creates the two players
  def create_players
    @player_one = make_player(1)
    @player_two = make_player(2)
  end

  # asks the player for board selection
  def player_selection(board)
    puts "#{@current_player.name} place your mark."
    selection = gets.to_i - 1
    board[selection] = @current_player.mark
  end

  # changes the @current_player to let the players take turns
  def turn
    @current_player = @current_player == player_one ? player_two : player_one
  end

  # checks for a winner
  def check_winner(board, combo)
    # if the combo is filled with the same player mark, puts winner and end the game
    combo.each do |e1, e2, e3|
      if board[e1] == @current_player.mark && board[e2] == @current_player.mark && board[e3] == @current_player.mark
        puts "#{@current_player.name} you're have won the game!"
      end
    end
  end
end

# calling and testing methods from the Game class
new_game = Game.new

# Plays the game 9 times
i = 0

while i < 9
  display_board(board)
  new_game.player_selection(board)
  new_game.turn
  new_game.check_winner(board, winning_combos)
  i += 1
end