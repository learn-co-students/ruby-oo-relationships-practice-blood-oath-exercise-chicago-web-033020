class Cult
  attr_accessor :name, :location, :founding_year, :slogan, :minimum_age
  @@all = []
  def initialize(name, location, founding_year, slogan, minimum_age)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @minimum_age = minimum_age
    self.class.all << self
  end

  def recruit_follower(follower)
    oath = BloodOath.new(follower, self)
  end

  def cult_population
    # self.followers.size
    followers.size
  end

  def average_age
    a = followers.map{|f| f.age}
    a.sum.to_f/self.cult_population
  end

  def my_followers_mottos
    followers.each do |f|
      puts "#{f.life_motto}"
    end
  end

  def followers
    # access BloodOath to get all the followers having the 
    # same cult. Return all followers in an array
    a = BloodOath.all.select{|o| o.cult == self}
    a.map {|cf| cf.follower}
  end

  def self.least_popular
    self.all.min_by{|c| c.followers.size}
  end

  def self.most_common_location
    a = self.all.map {|c| c.location}
    a.max_by{|city| a.count(city)}
  end

  def self.all
    @@all
  end
end
