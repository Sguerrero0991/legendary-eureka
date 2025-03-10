require './lib/ride'
require './lib/biker'
require './lib/bike_club'
require 'pry'

RSpec.describe BikeClub do
  it 'exists and has attributes' do
    bike_club = BikeClub.new("Fallen Angels")
    expect(bike_club).to be_a(BikeClub)
    expect(bike_club.name).to eq("Fallen Angels")
    expect(bike_club.bikers).to eq([])

  end
  it 'adds a list of bikers' do
    bike_club = BikeClub.new("Fallen Angels")
    biker1 = Biker.new("Kenny", 30)
    biker2 = Biker.new("Athena", 15)
    biker3 = Biker.new("Steph", 33)

    bike_club.add_biker(biker1)
    bike_club.add_biker(biker2)
    bike_club.add_biker(biker3)
  end

  it 'calculates most_rides' do
    bike_club = BikeClub.new("Fallen Angels")
    biker1 = Biker.new("Kenny", 30)
    biker2 = Biker.new("Athena", 15)

    bike_club.add_biker(biker1)
    bike_club.add_biker(biker2)

    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    ride3 = Ride.new({name: "Lake Placid", distance: 15.7, loop: true, terrain: :grass})
 

    biker1.learn_terrain(:gravel)
    biker1.learn_terrain(:hills)
    biker2.learn_terrain(:gravel)
    biker2.learn_terrain(:hills)
    biker2.learn_terrain(:grass)

    biker1.log_ride(ride1, 92.5)
    biker2.log_ride(ride1, 91.1)

    biker1.log_ride(ride2, 60.9)
    biker2.log_ride(ride2, 61.6)

    biker2.log_ride(ride3, 31.4)

    expect(bike_club.most_rides).to eq()

  end


end