require_relative 'follower.rb'
require_relative 'cult.rb'
require 'time'

class BloodOath

  attr_accessor :follower, :cult, :initiation_date
  @@all = []

  def initialize(follower, cult)
    @follower = follower
    @cult = cult
    @initiation_date = "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
    @@all << self
  end

  def self.all
    @@all
  end

  def self.first_oath
    sorted = self.all.sort_by do |dates|
      Time.parse(dates.initiation_date)
    end
    sorted[0].follower
  end

end