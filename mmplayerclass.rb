#Mastermind Game
class PlayerGuessGame

    @@turn_count = 0
    winner = ''
    @@matches = 0
    @@color_matches = 0
    @@player = ''
    
    
    @@board = [
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
    
    def create_code()
        colors = ['r','o','y','g','b','p']
        @code = colors.sample(4)
        p @code
    end


    def player_guess()
        puts "#{@@player}, please enter your guess of four colors."
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

    end

    def add_to_board(board)
    board[@@turn_count][0] = @color_one
    board[@@turn_count][1]= @color_two
    board[@@turn_count][2] = @color_three
    board[@@turn_count][3] = @color_four
    display_board(@@board)
    @@turn_count += 1

    end

    def match()
        if @color_one == @code[0]
            @@matches += 1
            puts "MATCH"
        end
        if @color_two == @code[1]
            @@matches += 1
            puts "MATCH"
        end
        if @color_three == @code[2]
            @@matches += 1
            puts "MATCH"
        end
        if @color_four == @code[3]
            @@matches += 1
            puts "MATCH"
        end
        
        if @@matches == 0 && (@color_one == @code[1] || @color_one == @code[2] || @color_one == @code[3])
            @@color_matches += 1
            puts "match1"
        end
        if (@color_two != @color_one) && (@color_two == @code[0] || @color_two == @code[2] || @color_two == @code[3])
            @@color_matches += 1
            puts "match2"
        end
        if (@color_three != @color_one && @color_three != @color_two) && (@color_three == @code[0] || @color_three == @code[1] || @color_three == @code[3])
            @@color_matches += 1
            puts "match3"
        end
        if (@color_four != @color_one && @color_four != @color_two && @color_four != @color_three) &&(@color_four == @code[0] || @color_four == @code[1] || @color_four == @code[2])
            @@color_matches += 1
            puts "match4"  
        end

        if @@matches == 0 && @@color_matches == 0
            puts "You have 0 MATCHES and 0 matches."
        end

    end

    def win()
        if @@matches == 4
            @@turn_count = 12
            puts "YOU HAVE BROKEN THE CODE AND WON!"
            puts "Congratulations, #{@@player}"
        elsif @@turn_count == 12 and @@matches != 4
            puts "Sorry, #{@@player}.  You did not crack Mastermind's code."
        end
        # reset matches after checking
        @@matches = 0
        @@color_matches = 0
    end

    def play_game()
        @@player = gets.chomp
        create_code()
        puts "\r\n"
        puts "Here is your empty Mastermind board."
        puts "\r\n"
        display_board(@@board)
        puts "\r\n"

            until @@turn_count >= 12 do
                player_guess()
                add_to_board(@@board)
                match()
                win()
        
        end

    end

end
    
    
#instructions
puts "Welcome to Mastermind!"
puts "In this game, you will try and guess the pattern of 4 colors that the computer has chosen."
puts "The colors are:"
puts "r for red,"
puts "o for orange,"
puts "y for yellow,"
puts "g for green,"
puts "b for blue, and"
puts "p for purple"
puts "Enter your four choices with a space between them."
puts "A message of 'MATCH' means your color is correct and in the correct space."
puts "A message of 'match' means your color is correct but NOT in the right space."
puts "Let's start!"
puts "Player, type your name."



#create_code()
game = PlayerGuessGame.new

game.play_game()



