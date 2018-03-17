class TicTacToe
  WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8], #horizontal
  [0, 3, 6], [1, 4, 7], [2, 5, 8], #vertical
  [0, 4, 8], [2, 4, 6] #diagonal
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def board=(board)
    @board = board
  end

  def board
    @board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, value)
    board[index] = value
  end

  def position_taken?(index)
    if board[index] == " " || board[index] == ""
      false
    elsif board[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(index)
    if !position_taken?(index) && index.between?(0, 8)
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count.even?
      "X"
    elsif turn_count.odd?
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end

  def full?
    if board.include?(" ") || board.include?("")
      return false
    else
      return true
    end
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  def over?
    if won? && full? || won? && !full? || draw?
      return true
    end
  end

  def winner
    if winning_combo = won?
      board[winning_combo.first]
    end
  end

  def play
    until over?
        turn
      end
      if winner
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
end

play = TicTacToe.new