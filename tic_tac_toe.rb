# Board class
class Board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "---+---+---"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "---+---+---"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end

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
  attr_reader :player_one, :player_two
  
  def initialize
    @player_one = nil
    @player_two = nil
    @current_player = nil
    @game_board = Board.new
  end

  def create_player(number)
    puts "Player #{number}, what is your name?"
    name = gets.chomp
    puts "#{name}, what would you like your mark to be?" 
    mark = gets.chomp
    Player.new(name, mark)
  end

  def set_players
    @player_one = create_player(1)
    @player_two = create_player(2)
  end

  def show_board
    @game_board.display_board()
  end
end

new_game = Game.new
