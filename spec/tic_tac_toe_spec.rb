require './lib/tic_tac_toe.rb'

describe Game do
  describe "#check_if_game_ends" do
    it "returns true if 3 same markers are in a row" do
      player = Player.new("X", "Player1")
      player.add_choice(1)
      player.add_choice(2)
      player.add_choice(3)
      game = Game.new
      expect(game.check_if_game_ends(player)).to be_truthy
    end
  
    it "returns true if 3 same markers are in a diagonal" do
      player = Player.new("X", "Player1")
      player.add_choice(1)
      player.add_choice(5)
      player.add_choice(9)
      game = Game.new
      expect(game.check_if_game_ends(player)).to be_truthy
    end
    
    it "returns false if 3 different markers are in a row" do
      player1 = Player.new("X", "Player1")
      player2 = Player.new("O", "Player2")
      player1.add_choice(1)
      player2.add_choice(2)
      player1.add_choice(3)
      game = Game.new
      expect(game.check_if_game_ends(player1)).to be_falsey
    end
  end
end