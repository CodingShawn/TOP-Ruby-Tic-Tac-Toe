require 'pry'

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
	attr_reader :marker, :choices, :name
	def initialize(marker, name)
		@marker = marker
		@name = name
		@choices = []
	end

	def mark_spot
		location = 0
		until location > 0 && location < 10 do
			puts "Please chose input a number from 1 to 9 to mark a spot"
			location = gets.chomp.to_i
		end
		location
	end

	def add_choice(location)
		@choices.push(location)
	end	
end

class Game
	WIN_CONDITIONS = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
	def initialize
		@player1 = Player.new("X", "Player 1")
		@player2 = Player.new("O", "Player 2")
		@board = Board.new
		@players_choices = []
	end

	def update_choices(player,location)
		player.add_choice(location)
		@players_choices.push(location)
	end	

	def check_if_game_ends(player)
		WIN_CONDITIONS.any? { |win_condition| (win_condition - player.choices) == []}
	end

	def start_game
		for i in 0..8
			if i % 2 == 0
				current_player = @player1
			else
				current_player = @player2
			end

			location = current_player.mark_spot
			while @players_choices.include? location
				puts "That spot has been taken, please choose another spot!"
				@board.show_display
				location = current_player.mark_spot
			end 
			update_choices(current_player, location)
			marker = current_player.marker
			@board.update_display(location, marker)
			@board.show_display
			if check_if_game_ends(current_player)
				puts "Congratulations! #{current_player.name} wins!"
				break
			end
		end
	end
end	