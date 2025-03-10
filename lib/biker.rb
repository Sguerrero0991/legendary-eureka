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

  def log_ride(ride, time)
    unless @acceptable_terrain.include?(ride.terrain) #checks to make sure acceptable_terrains a given terrain
      return
    end

    if ride.distance > @max_distance # checks if the ride exceeds the biker's max distance
      return
    end

    if rides[ride]  #check if ride already has a distance logged
      rides[ride] << time  #add new distance to array
    else
      rides[ride] = [time]  #creates the new array with the first distance at the first element
    end
  end
  #it was a dumb syntax error on line 25 I had time written 

  # def log_ride(ride, time)
  #   rides[ride] = time
  #   binding.pry
  # end

  def personal_record(ride)
    rides[ride].min
  end
end