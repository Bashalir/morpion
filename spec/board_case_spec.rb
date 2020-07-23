# frozen_string_literal: true

require 'board_case'

describe 'BoardCase' do
  it 'Create a case with index 1 "A" Row "1" Column and "false" Player' do
    board_case = BoardCase.new(1, 'A', '1')
    expect(board_case.index).to eq(1)
    expect(board_case.row).to eq('A')
    expect(board_case.column).to eq('1')
    expect(board_case.player).to be false
  end
end
