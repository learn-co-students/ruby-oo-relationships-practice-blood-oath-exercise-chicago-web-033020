require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
scientology = Cult.new("Scientology", "Chicago", 1950, "To be a scientologist is definitely not like being in a cult", 18)
pizza_monsters = Cult.new("Pizza Monsters", "Chicago", 1999, "PIIIZZZZZAAA cult", 50)
big_cat_rescue = Cult.new("Big Cat Rescue", "Florida", 2019, "Hey all of you cool cats and kittens", 5)

sam = Follower.new("Sam", 100, "I LOVE CULTS!")
claire = Follower.new("Claire", 55)
dave = Follower.new("Dave", 80)

scientology.recruit_follower(sam)
scientology.recruit_follower(claire)
#big_cat_rescue.recruit_follower(sam)

sam.join_cult(pizza_monsters)
dave.join_cult(pizza_monsters)
dave.join_cult(scientology)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits