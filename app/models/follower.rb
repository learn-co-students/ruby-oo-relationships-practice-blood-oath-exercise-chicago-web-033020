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
    # create an array of follower instances 
    # then find the one occurs the most
    a = Follower.all_followers #????
    # a = BloodOath.all.map{|b| b.follower}  
    a.max_by{|follw| a.count(follw)}
  end

  def self.all_followers
    BloodOath.all.map{|b| b.follower} 
  end

  def self.top_ten
    # # get an array of followers from all the bloodoath made
    # # arr = BloodOath.all.map{|b| b.follower}
    # arr = Follower.all_followers #????
    # # group them by follower
    # a = arr.group_by{|c|c}
    # # turn into an array
    # b = a.to_a
    # # sort by size (- sign is for reverse order) of the array in index 1 which is an array
    # # containing the same follower occurrence
    # c = b.sort_by{|y| -y[1].size}
    # # extrac top 10 from index 0
    # d = c[0..9].map{|e|e[0]}

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
    f_oaths = []
    # get all oaths that has the same cult(s)
    all_my_cult.each do |all_c| 
      f_oaths << BloodOath.all.select{|c| c.cult == all_c }
    end
    # remove self from the list because method only wants the 
    # rest of followers
    fellow = f_oaths.flatten.map{|f|f.follower}.uniq.select{|felw| felw != self}
  end

  def self.all
    @@all
  end
end