
class Board

    def initialize
        @layout = [[' ',' ',' '],[' ',' ',' '],[' ',' ',' ']]
        @moves = 9
        showBoard
    end
  
    def showBoard
        puts "\n"
        puts "    1.   2.   3."
        print "a.", @layout[0], "\n"
        print "b.", @layout[1], "\n"
        print "c.", @layout[2], "\n"
        gameState
    end

    def gameState
       winner = "\nWe have a winner! Starting a new game:" 
       @layout.each do |x| 
          if x[0]==x[1] && x[0]==x[2] && x[0] !=" " 
          puts winner
          initialize
         end
       end
       @layout.transpose.each do |x| 
          if x[0]==x[1] && x[0]==x[2] && x[0] !=" " 
          puts winner
          initialize
          end
       end
      if (@layout[0][0] == @layout[1][1] && @layout[2][2] == @layout[1][1] && @layout[0][0] != " ") || (@layout[0][2]== @layout[1][1] && @layout[2][0] == @layout[1][1] && @layout[0][2] != " ")
      puts winner
          initialize
    end
      nextTurn
    end
  
    def nextTurn
      if @moves.odd?
            puts "\nCircle's turn (e.g. a1):"
      elsif @moves == 0
          puts "No winners! Start over!"
          initialize
      else
            puts "\nCross' turn (e.g. b2):"
      end
      
      coordinates = {
        "a1" => [0,0],
        "a2" => [0,1],
        "a3" => [0,2],
        "b1" => [1,0],
        "b2" => [1,1],
        "b3" => [1,2],
        "c1" => [2,0],
        "c2" => [2,1],
        "c3" => [2,2]
      } 

      loop do
        move = gets.chomp
        if coordinates[move].nil? 
          puts "Not a valid coordinate. Try again:"
          next
        else 
          turn(coordinates[move][0],coordinates[move][1])
        break
        end
      end
    end
    
    def turn(x, y)
        if @moves.odd? && @layout[x][y]==' '
            @layout[x][y]='O'
            @moves -= 1
            showBoard
        elsif @moves.even? && @layout[x][y]==' '
            @layout[x][y]='X'
            @moves -= 1
            showBoard
        else
            puts "Not a legal move!"
          showBoard
        end
    end
end

puts "Want to play a game of Tic Tac Toe? y/n"
answer = gets.chomp

puts answer == "y" ? game = Board.new : "Too bad"


