require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

mycult = Cult.new("some cult", "Chicago", 1938, "Live long and prosper.", 19)
hiscult = Cult.new("His cult", "Chicago", 1977, "Live and let live.", 20)
hercult = Cult.new("Her cult", "NYC", 2009, "Men are bad", 21)

# p mycult
# p Cult.all

follower1 = Follower.new("John", 23, "I am Spock")
follower2 = Follower.new("Dave", 44, "I am Kirk")
follower3 = Follower.new("Jane", 55, "I love chocolat")
follower4 = Follower.new("Jack", 18, "Life is short")

# p Follower.of_a_certain_age(25)

oath1 = follower1.join_cult(mycult)
oath1a = follower1.join_cult(mycult)
# puts "oath1 date is #{oath1.initiation_date}"
oath2 = mycult.recruit_follower(follower2)
oath3 = follower3.join_cult(mycult)
oath4 = hiscult.recruit_follower(follower1)
oath5 = follower2.join_cult(hiscult)
oath6 = follower3.join_cult(hercult)
oath7 = follower2.join_cult(hercult)
oath8 = mycult.recruit_follower(follower4)
oath9 = follower4.join_cult(hiscult)
# puts "oath2 date is #{oath2.initiation_date}"
p mycult.cult_population
p hiscult.cult_population
p hercult.cult_population
p mycult.average_age
p mycult.my_followers_mottos
# p Cult.least_popular
# p Cult.most_common_location
# p Follower.most_active
p Follower.top_ten
# p follower1.fellow_cult_members
# p BloodOath.all
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
