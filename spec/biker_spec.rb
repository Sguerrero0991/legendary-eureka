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

  it 'logs rides and adds them to a hash' do
    biker = Biker.new("Kenny", 30)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

    biker.learn_terrain(:gravel)
    biker.learn_terrain(:hills)

    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride1, 91.1)
    biker.log_ride(ride2, 60.9)
    biker.log_ride(ride2, 61.6)

    expected = {
      ride1 => [92.5, 91.1],
      ride2 => [60.9, 61.6]
    }
    expect(biker.rides).to eq(expected)
  end

  it 'sets a personal_record' do
    biker = Biker.new("Kenny", 30)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

    biker.learn_terrain(:gravel)
    biker.learn_terrain(:hills)

    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride1, 91.1)
    biker.log_ride(ride2, 60.9)
    biker.log_ride(ride2, 61.6)

    expect(biker.personal_record(ride1)).to eq(91.1)
    expect(biker.personal_record(ride2)).to eq(60.9)
  end

  it 'checks all existing tests by adding a 2nd biker' do
    biker2 = Biker.new("Athena", 15)

    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

    biker2.log_ride(ride1, 97.0)
    biker2.log_ride(ride2, 67.0)

    expect(biker2.rides).to eq({})

    biker2.learn_terrain(:gravel)
    biker2.learn_terrain(:hills)

    biker2.log_ride(ride1, 95.0)  # biker2 can't bike this distance
    biker2.log_ride(ride2, 65.0)  # biker2 knows this terrain and can bike this distance

    expected = {
      ride2 => [65.0],
      ride1 => [95.0]
    }
    
    expect(biker2.rides).to eq(expected)


    expect(biker2.personal_record(ride2)).to eq(65.0)
    expect(biker2.personal_record(ride1)).to eq(95.0)
  end


end 