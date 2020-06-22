class Board
  def initialize
		@display = []
		for i in 0..4
			if i % 2 == 0 
				@display += ["   |   |   "]
			else
				@display += ["-----------"]
			end
		end
	end

	def update_display(location, marker)
		row = 0
		column = 0

		case location
		when 1..3
			row = 0
		when 4..6
			row = 2
		else
			row = 4
		end

		case location
		when 1, 4, 7
			column = 1
		when 2, 5, 8
			column = 5
		else
			column = 9
		end

		@display[row][column] = marker
	end
	
	def show_display
		puts @display
	end	
end

class Player
	def initialize(marker)
		@marker = marker
	end

	def mark_spot
		location = 0
		until location > 0 && location < 10 do
			puts "Please chose input a number from 1 to 9 to mark a spot"
			location = gets.chomp.to_i
		end
	end
end

class Game
	def initialize
		@player1 = Player.new("X")
		@player2 = Player.new("O")
	end

	def start_game
	end
end	

		
x = Board.new
for i in 1..9
	x.update_display(i, "X")
end
x.show_display
