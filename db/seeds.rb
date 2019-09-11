puts "Creating Users"
u1 = User.create :email => 'ajtauber@ga.co', :password => 'chicken'

u2 = User.create :email => 'streamer@twitch.tv', :password => 'chicken'

u3 = User.create :email => 'Ninja@Mixer.co', :password => 'chicken'
