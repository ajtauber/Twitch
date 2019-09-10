

puts "Creating Users"
u1 = User.create :email => 'ajtauber@ga.co', :password => 'chicken'


puts "Creating Twitch"
t1 = Twitches.create :name => 'Phil'
