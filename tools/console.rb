require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Create Class Cult Instances
vampires = Cult.new("Vampires", "Transylvania", 1751, "faaaaaaaaaaangs fo lyfe")
werewolves = Cult.new("Werewolves", "Forest", 1643, "woof woof bow bow")

#Create Class Follower Instances 
dracula = Follower.new("Dracula", 25, "fly fly flyyyy")
buffy = Follower.new("Buffy", 18, "idk man")
jacob = Follower.new("Jacob", 21, "pick me!!!")

vampires.recruit_follower(buffy)
vampires.recruit_follower(dracula)
werewolves.recruit_follower(jacob)

buffy_bloodoath= BloodOath.new(buffy, vampires)
jacob_bloodoath= BloodOath.new(jacob, werewolves)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
