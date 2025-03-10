require 'pry'
require './lib/ride'
class Biker
  attr_reader :name, :max_distance, :rides, :acceptable_terrain
  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, distance)
    if rides[ride]  #check if ride already has a distance logged
      rides[ride] << distance  #add new distance to array
    else
      rides[ride] = [distance]  #creates the new array with the first distance at the first element
    end
    binding.pry
  end

  # def log_ride(ride, distance)
  #   rides[ride] = distance
  #   binding.pry
  # end
end