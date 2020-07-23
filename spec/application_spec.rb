# frozen_string_literal: true

require 'application'
require 'game'

describe 'Application' do
  before do
    @application = Application.new
  end

  it'Start a game' do
    @application.start_game
    expect(@application.game).to be_an_instance_of(Game)
  end
end
