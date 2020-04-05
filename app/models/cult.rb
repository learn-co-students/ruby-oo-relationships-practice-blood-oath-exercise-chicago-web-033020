class Cult
  attr_reader :name, :founding_year
  attr_accessor :location, :slogan

  @@all = []

  def initialize(name, location, founding_year, slogan="joooiiiin us earthling")
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan 
    @@all << self
  end

  def self.all
    @@all
  end

  def recruit_follower(name)
    Bloodoath.new(self, name)
  end

  def cult_population
    Bloodoath.all.select { |bloodoath| bloodoath.cult == self }.length
  end

  def self.find_by_name(cult_name)
    Cult.all.find { |cult| cult.name == cult_name }
  end

  def self.find_by_location(location)
    Cult.all.select { |cult| cult.location == location }
  end

  def self.find_by_founding_year(year)
    Cult.all.select { |cult| cult.founding_year == year }
  end

  def followers
    Bloodoath.all.select { |bloodoath| bloodoath.cult == self}
  end

  def average_age
    ages = self.followers.map { |bloodoath| bloodoath.follower.age }
    total = ages.reduce(:+)
    total.to_f / self.cult_population
  end
end