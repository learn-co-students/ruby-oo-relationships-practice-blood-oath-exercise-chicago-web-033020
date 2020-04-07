require_relative  'bloodoath.rb'

class Cult

  attr_reader :name, :location, :founding_year, :slogan
 
  @@all = []

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @followers = []
    @@all << self
  end

  def self.all
    @@all
  end

  def recruit_follower(follower)
    @followers << follower
  end

  def cult_population
    @followers.count
  end

  def self.find_by_name(name)
    @@all.find do |cults|
      cults.name == name
    end
  end

  def self.find_by_location(location)
    @@all.select do |cults|
      cults.location == location
    end
  end

  def self.find_by_founding_year(founding_year)
    @@all.select do |cults|
      cults.founding_year == founding_year
    end
  end


end