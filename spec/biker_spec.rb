require './lib/ride'
require './lib/biker'
require 'pry'

RSpec.describe Biker do
  it 'exists' do
    biker = Biker.new("Kenny", 30)
    expect(biker).to be_a(Biker)
  end

  it 'has attributes' do
    biker = Biker.new("Kenny", 30)
    expect(biker.name).to eq("Kenny")
    expect(biker.max_distance).to eq(30)
    expect(biker.rides).to eq({})
  end

  it 'learns the terrain type and adds to list of acceptable terrains' do
    biker = Biker.new("Kenny", 30)

    biker.learn_terrain(:gravel)
    biker.learn_terrain(:hills)

    expect(biker.acceptable_terrain).to eq([:gravel, :hills])
  end

  it 'logs rides' do
    
  end
end 