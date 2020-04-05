require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
scientology = Cult.new("Scientology", "Chicago", 1950, "To be a scientologist is definitely not like being in a cult")
pizza_monsters = Cult.new("Pizza Monsters", "Chicago", 1999, "PIIIZZZZZAAA cult")
big_cat_rescue = Cult.new("Big Cat Rescue", "Florida", 2019, "Hey all of you cool cats and kittens")

sam = Follower.new("Sam", 100)
claire = Follower.new("Claire", 55)

scientology.recruit_follower(sam)
scientology.recruit_follower(claire)
big_cat_rescue.recruit_follower(sam)

#sam.join_cult("Scientology")
#sam.join_cult("Pizza Monsters")

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
