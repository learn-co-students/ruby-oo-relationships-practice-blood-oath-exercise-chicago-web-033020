class Cult
  attr_reader :name, :founding_year
  attr_accessor :location, :slogan, :minimum_age

  @@all = []

  def initialize(name, location, founding_year, slogan, minimum_age=0)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan 
    @minimum_age = minimum_age
    @@all << self
  end

  def self.all
    @@all
  end

  def recruit_follower(name)
    name.age >= self.minimum_age ? (Bloodoath.new(self, name)) : (puts "Sorry you're not old enough. Come back in #{self.minimum_age - name.age} years!")
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

  #helper method - gets all follower_instances for a particular cult
  def followers_instances
    Bloodoath.all.select { |bloodoath| bloodoath.cult == self}
  end

  def followers
    followers_instances.map { |instance| instance.follower }
  end

  def average_age
    ages = self.followers.map { |bloodoath| bloodoath.follower.age }
    total = ages.reduce(:+)
    total.to_f / self.cult_population
  end

  def my_followers_mottos
    followers.each { |follower| puts "#{follower.name}: #{follower.life_motto}" }
  end

  def self.least_popular
    list = Bloodoath.all.map { |bloodoath| bloodoath.cult }
    list.min_by { |cult| list.count(cult)}
  end

  def self.most_common_location
    locations = Cult.all.map { |cult| cult.location } 
    locations.max_by {|location| locations.count(location)}
  end

end
