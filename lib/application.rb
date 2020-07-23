# frozen_string_literal: true

class Application
  attr_accessor :game

  def start_game
    @game = Game.new
  end
end
