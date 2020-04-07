require_relative 'follower.rb'
require_relative 'cult.rb'

class BloodOath

  attr_reader :initiation_date, :follower
  @@all = []

  def initialize(initiation_date)
    @initiation_date = initiation_date
    @@all << self
  end

  def self.all
    @@all
  end

end