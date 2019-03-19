require 'awesome_type/enum'

RSpec.describe AwesomeType::Enum do
  class Status < AwesomeType::Enum
    define Active: 1, Inactive: 0
  end

  it 'can be defined with values' do
    active = Status.Active
    inactive = Status.Inactive
    expect(active).to be_a(Status)
    expect(inactive).to be_a(Status)
    expect(active.value).to eq 1
    expect(inactive.value).to eq 0
  end

  class Direction < AwesomeType::Enum
    define :North, :South, :East, :West

    # def opposite_direction
    # end

    # public Direction getOppositeDirection() {
    #   return VALUES[(ordinal() + 2) % 4];
    # }
  end

  it 'can be defined without values' do
    north = Direction.North
    south = Direction.South
    east = Direction.East
    west = Direction.West
    expect(north).to be_a(Direction)
    expect(south).to be_a(Direction)
    expect(east).to be_a(Direction)
    expect(west).to be_a(Direction)
    expect(north.value).to eq 1
    expect(south.value).to eq 2
    expect(east.value).to eq 3
    expect(west.value).to eq 4
  end

  it 'can\'t make undefined enum' do
    expect{ Direction.NorthEast }.to raise_error NoMethodError
  end

  it 'can\'t directly use the constructor' do
    expect{ Direction.new(5) }.to raise_error NoMethodError, "private method `new' called for Direction:Class"
  end
end
