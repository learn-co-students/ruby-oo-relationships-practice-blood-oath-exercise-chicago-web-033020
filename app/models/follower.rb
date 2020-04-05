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

  def cults
    sam_cults = Bloodoath.all.select { |bloodoath| bloodoath.follower == self}
    sam_cults.map { |bloodoath| bloodoath.cult }
  end

  def join_cult(cult_name)
    cult = Cult.find_by_name(cult_name)
    if cult 
      Bloodoath.new(cult, self)
    end
  end

  def self.of_a_certain_age(min_age)
    self.all.select { |follower| follower.age >= min_age }
  end

end