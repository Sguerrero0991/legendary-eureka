require 'pry'
require './lib/ride'
require './lib/biker'
class BikeClub
  attr_reader :name, :bikers
  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  def most_rides
    @bikers.each do |ride|
  end
end