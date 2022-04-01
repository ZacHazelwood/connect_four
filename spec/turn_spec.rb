require './lib/turn'
require './lib/board'

RSpec.describe Turn do
  xit "exists" do
    turn = Turn.new()

    expect(turn).to be_an_instance_of(Turn)
  end

  xit "adds X" do
    turn = Turn.new()

    turn.add_x(6, 0)
    expect().to
  end

  xit "adds O" do
    turn = Turn.new()

    turn.add_o(6, 6)
    expect().to
  end
end
