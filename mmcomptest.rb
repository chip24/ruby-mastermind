# Mastermind - Computer Guess Version

@turn_count = 0
@matches = 0
@color_matches = 0

@board = [
    ['-','-','-','-'],
    ['-','-','-','-'],
    ['-','-','-','-'],
    ['-','-','-','-'],
    ['-','-','-','-'],
    ['-','-','-','-'],
    ['-','-','-','-'],
    ['-','-','-','-'],
    ['-','-','-','-'],
    ['-','-','-','-'],
    ['-','-','-','-'],
    ['-','-','-','-']
    ]
  
  
  
  def display_board(board)
    puts "12 #{board[11][0]} | #{board[11][1]} | #{board[11][2]} | #{board[11][3]}" 
    puts "-----------------"
    puts "11 #{board[10][0]} | #{board[10][1]} | #{board[10][2]} | #{board[10][3]}" 
    puts "-----------------"
    puts "10 #{board[9][0]} | #{board[9][1]} | #{board[9][2]} | #{board[9][3]}" 
    puts "-----------------"
    puts "9  #{board[8][0]} | #{board[8][1]} | #{board[8][2]} | #{board[8][3]}" 
    puts "-----------------"
    puts "8  #{board[7][0]} | #{board[7][1]} | #{board[7][2]} | #{board[7][3]}" 
    puts "-----------------"
    puts "7  #{board[6][0]} | #{board[6][1]} | #{board[6][2]} | #{board[6][3]}" 
    puts "-----------------"
    puts "6  #{board[5][0]} | #{board[5][1]} | #{board[5][2]} | #{board[5][3]}" 
    puts "-----------------"
    puts "5  #{board[4][0]} | #{board[4][1]} | #{board[4][2]} | #{board[4][3]}" 
    puts "-----------------"
    puts "4  #{board[3][0]} | #{board[3][1]} | #{board[3][2]} | #{board[3][3]}" 
    puts "-----------------"
    puts "3  #{board[2][0]} | #{board[2][1]} | #{board[2][2]} | #{board[2][3]}" 
    puts "-----------------"
    puts "2  #{board[1][0]} | #{board[1][1]} | #{board[1][2]} | #{board[1][3]}" 
    puts "-----------------"
    puts "1  #{board[0][0]} | #{board[0][1]} | #{board[0][2]} | #{board[0][3]}" 
    puts "-----------------"
  
  end

  def enter_code()
    puts "Enter your four choices with a space between them."
    input = gets.chomp
    input_array = input.split
    @color_one = input_array[0]
    @color_two = input_array[1]
    @color_three = input_array[2]
    @color_four = input_array[3]
    
  
      # loop until the user input is valid (has spaces between, includes four colors, and includes one of the six color codes)
      until input.count("^roygbp ") == 0 && input_array.count == 4
          puts "Make sure you entered a valid list of four colors including only r, o, y, g, b, and, p with a space between each color."
          input = gets.chomp
          input_array = input.split
          @color_one = input_array[0]
          @color_two = input_array[1]
          @color_three = input_array[2]
          @color_four = input_array[3]
          
      
    end
    puts "Your code is #{@color_one}, #{@color_two}, #{@color_three}, and #{@color_four}."
end

def comp_guess()
    colors = ["r","o","y","g","b","p"]
    
    if @correct_one != nil
        @g_one = @correct_one
    else
        @g_one = colors.sample(1)[0]
    end

    if @correct_two != nil
        @g_two = @correct_two
    else
        @g_two = colors.sample(1)[0]
    end

    if @correct_three != nil
        @g_three = @correct_three
    else
        @g_three = colors.sample(1)[0]
    end

    if @correct_four != nil
        @g_four = @correct_four
    else
        @g_four = colors.sample(1)[0]
    end


    puts "The computer has guessed #{@g_one}, #{@g_two}, #{@g_three}, and #{@g_four}."

    add_to_board(@board)
 
end

def add_to_board(board)
    board[@turn_count][0] = @g_one
    board[@turn_count][1] = @g_two
    board[@turn_count][2] = @g_three
    board[@turn_count][3] = @g_four
    display_board(@board)
    @turn_count += 1

end

def match()
    if @color_one == @g_one
        @matches += 1
        @correct_one = @g_one
        p @correct_one
    end
    if @color_two == @g_two
        @matches += 1
        @correct_two = @g_two
        p @correct_two

    end
    if @color_three == @g_three
        @matches += 1
        @correct_three = @g_three
        p @correct_three
    end
    if @color_four == @g_four
        @matches += 1
        @correct_four = @g_four
        p @correct_four
    end
    puts "The computer has found #{@matches} exact match(es)."
    # @matches = 0
end

def color_match()
    if @g_one == @color_two || @g_one == @color_three || @g_one == @color_four  
        @color_matches +=1
    end
    if @g_two == @color_one || @g_two == @color_three || @g_two == @color_four  
        @color_matches +=1
    end
    if @g_three == @color_one || @g_three== @color_two || @g_three == @color_four  
        @color_matches +=1
    end
    if @g_four == @color_one || @g_four == @color_two || @g_four == @color_three  
        @color_matches +=1
    end
    puts "The computer has found #{@color_matches} color match(es)."
    #@color_matches = 0
    

end

def win()
    if @matches == 4
        @turn_count = 12
        puts "I have cracked your code and won Mastermind!"
    elsif @turn_count == 12 && @matches != 4
        puts "You have outsmarted me.  I could not crack your code."
    else
        @matches = 0
        @color_matches = 0
    end
end


def play_game()
    until @turn_count >= 12 do
        comp_guess()
        match()
        color_match()
        win()
        p @matches
        p @color_matches
        
        sleep 4
    end
end
 
# instructions

puts "Welcome to Mastermind - Computer Guess"
puts "Player, enter your name."
@player = gets.chomp
puts "In this game, #{@player}, you will choose a pattern of 4 colors, and the I will try to guess it."
puts" If I can't guess it in 12 turns, you win.  Otherwise, you lose."
puts "The colors are:"
puts "r for red,"
puts "o for orange,"
puts "y for yellow,"
puts "g for green,"
puts "b for blue, and"
puts "p for purple"
puts "\r\n"

display_board(@board)
enter_code()
play_game()
#comp_guess()
#match()
#color_match()




