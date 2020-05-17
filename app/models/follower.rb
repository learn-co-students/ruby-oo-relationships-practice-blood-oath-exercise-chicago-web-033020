class Follower
  attr_accessor :name, :age, :life_motto
  @@all = []
  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    self.class.all << self
  end

  def join_cult(cult)
    oath = BloodOath.new(self, cult)
  end

  def self.of_a_certain_age(age)
    @@all.select {|f| f.age >= age}
  end

  def self.most_active
    # self.all retuns all the followers
    # .max compare each occurence in the array
    # each array occurence is an array containing the oaths taken by that one
    # folloer. By comparing the array length we know who has the most oaths
    self.all.max do|fl_a, fl_b|
      fl_a.follower_bloodoath.length <=> fl_b.follower_bloodoath.length
    end
  end

  def self.top_ten
    # max(10) will return the top 10 while max just return the top 1
    # max(?) return an array while max only return the intance
    self.all.max(10) do|fl_a, fl_b|
      fl_a.follower_bloodoath.length <=> fl_b.follower_bloodoath.length
    end
  end

  def follower_bloodoath
    BloodOath.all.select {|bo| bo.follower == self}
  end

  def fellow_cult_members
    # find all the oaths that has this cult instance
    my_cult = BloodOath.all.select{|oaths| oaths.follower == self}
    # create an array of only the cults
    all_my_cult = my_cult.map{|myoath| myoath.cult}
    f_oaths = all_my_cult.map do |all_c|
      all_c.all_bo_cult.collect {|cbo|cbo.follower}
    end 
    fellow = f_oaths.flatten.uniq.select{|felw| felw != self}
  end

  def self.all
    @@all
  end
end