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

  def self.find_by_name(name)
    self.all.find do |cults|
      cults.name == name
    end
  end

  def self.find_by_location(location)
    self.all.select do |cults|
      cults.location == location
    end
  end

  def self.find_by_founding_year(founding_year)
    self.all.select do |cults|
      cults.founding_year == founding_year
    end
  end

  def self.least_popular
    self.all.min_by do |cults|
      cults.followers.length
    end
  end

  def self.most_common_location
    ordered = self.all.max_by do |location, count|
      count
    end
    ordered[0]
  end

  def my_followers_mottos
    @followers.map do |followers|
      followers.life_mottos
    end
  end


  def average_age
    total_age = followers.reduce(0) do | sum, follower |
      sum + follower.age
    end
    total_age / followers.length
  end


  def recruit_follower(follower)
    @followers << follower
  end

  def cult_population
    @followers.length
  end

end