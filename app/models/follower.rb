class Follower
  attr_reader :name, :age
  attr_accessor :life_motto

  @@all = []

  def initialize(name, age, life_motto="No life motto set!")
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def self.all
    @@all
  end

  #returns all cults instances that self follow
  def cults_helper
    Bloodoath.all.select { |bloodoath| bloodoath.follower == self}
  end

  def cults
    cults_helper.map { |bloodoath | bloodoath.cult }.uniq
  end

  def join_cult(cult)
    cult.minimum_age <= self.age ? (Bloodoath.new(cult, self)) : (puts "Sorry you're not old enough. Come back in #{cult.minimum_age - self.age} years!")
  end

  def self.of_a_certain_age(min_age)
    self.all.select { |follower| follower.age >= min_age }
  end

  def my_cults_slogans
    cults.each { |cult| puts "#{cult.name}: #{cult.slogan}" }
  end

  def self.most_active
    follower_list = Bloodoath.all.map { |bloodoath| bloodoath.follower }
    follower_list.max_by { |follower| follower_list.count(follower)}
  end

  def self.top_ten
    follower_list = Bloodoath.all.map { |bloodoath| bloodoath.follower }
    counted_list = follower_list.inject(Hash.new(0)) { |new_hash, follower| new_hash[follower] += 1; new_hash }
    counted_list.map { |follower, cults| follower }[0..9]
  end

  def fellow_cult_members
    # Selects all cult members that have the same cults (currently only works for the right order!)
    same = Follower.all.select { |follower| follower.cults == self.cults }
    # Removes self from the array
    same.select { |follower| follower != self }
  end  

  # def all_same_cult_members
  #   same_array = []
  #   self_cults = self.cults
  #   index = 0
  #   while index < Follower.all.length
  #     follower_cults = Follower.all[index].cults
  #     if self_cults == follower_cults
  #        same_array << Follower.all[index]
  #        index += 1
  #     else
  #       index +=1
  #     end
  #   end
  #   same_array
  # end

  # def remove_self(array)
  #   array.select { |follower| follower != self }
  # end

  # def fellow_cult_members
  #   remove_self(all_same_cult_members)
  # end

end