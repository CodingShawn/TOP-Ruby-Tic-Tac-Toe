class Board
  def initialize
		@display = []
		for i in 0..4
			if i % 2 == 0 
				@display += ["  |   |  "]
			else
				@display += ["---------"]
			end
		end
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


x = Board.new
x.show_display
bob = Player.new("X")
puts bob.mark_spot

