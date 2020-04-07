class Bloodoath

  attr_reader :cult, :follower, :initiation_date

  @@all = []

  def self.all
    @@all
  end

  def initialize(cult, follower, initiation_date=Time.now.strftime("%Y/%m/%d"))
    @cult = cult
    @follower = follower
    @initiation_date = initiation_date
    @@all << self
  end

  def self.first_oath
    self.all.first 
  end

end