class BloodOath
  attr_reader :cult, :follower, :date
  @@all = []
  def initialize(follower, cult)
    # binding.pry
    if self.class.all.any?{|o|o.follower == follower && o.cult == cult}
      puts "Sorry, can't join the same cult again!"    
    elsif follower.age < cult.minimum_age
      puts "You are too young to join #{cult.name}."
      else
        @follower = follower
        @cult = cult
        @date = Time.now
        self.class.all << self
    end
  end

  def initiation_date
    date_s = self.date.strftime("%F") 
  end

  def self.all
    @@all
  end
end