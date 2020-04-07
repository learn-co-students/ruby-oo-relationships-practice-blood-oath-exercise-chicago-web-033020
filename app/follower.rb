require_relative 'bloodoath.rb'

class Follower

  attr_accessor :recruit_follower
  attr_reader :name, :age, :life_motto, :cults

  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @cults = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.of_a_certain_age(age)
    self.all.select do |follower|
      follower.age >= age
    end
  end

  def self.most_active
    self.all.cults.length.max
  end

  def join_cult(cult)
    cult.recruit_follower(self)
  end

  def my_cults_slogans
    cults.map do |cults|
      cults.slogan
    end
  end


end