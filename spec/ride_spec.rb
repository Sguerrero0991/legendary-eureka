require './lib/ride'
require 'pry'

RSpec.describe Ride do
  it 'exists' do
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    expect(ride1).to be_a(Ride)
  end

  
end