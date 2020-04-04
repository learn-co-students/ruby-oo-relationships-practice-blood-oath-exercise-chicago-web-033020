class Follower
  attr_accessor :name, :age, :life_motto, :cult
  @@all = []
  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    self.class.all << self
  end

  def join_cult(cult)
    # cult.followers << self
    oath = BloodOath.new(self, cult)
  end

  def self.of_a_certain_age(age)
    @@all.select {|f| f.age >= age}
  end

  def self.most_active
    # create an array of follower instances 
    # then find the one occurs the most
    a = BloodOath.all.map{|b| b.follower}  
    a.max_by{|follw| a.count(follw)}
  end

  def self.top_ten
    # get an array of followers from all the bloodoath made
    arr = BloodOath.all.map{|b| b.follower}
    # group them by follower
    a = arr.group_by{|c|c}
    # turn into an array
    b = a.to_a
    # sort by size (- sign is for reverse order) of the array in index 1 which is an array
    # containing the same follower occurrence
    c = b.sort_by{|y| -y[1].size}
    # extrac top 10 from index 0
    d = c[0..9].map{|e|e[0]}
  end

  def self.all
    @@all
  end
end