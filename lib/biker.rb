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
    @terrain = terrain
  end

  def acceptable_terrain(terrain)
    @acceptable_terrain << terrain
  end

  
end