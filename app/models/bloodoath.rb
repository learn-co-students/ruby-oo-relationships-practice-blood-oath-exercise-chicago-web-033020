class BloodOath
  attr_reader :cult, :follower, :date
  @@all = []
  def initialize(follower, cult)
    @follower = follower
    @cult = cult
    @date = Time.now
    self.class.all << self
  end

  def initiation_date
    date_s = self.date.strftime("%F") 
  end

  def self.all
    @@all
  end
end