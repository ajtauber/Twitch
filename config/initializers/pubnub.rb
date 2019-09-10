# require 'pubnub'
#
# pubnub = Pubnub.new(
#     subscribe_key: "sub-c-c197d3f6-d2a0-11e9-a890-82ed7f392ada",
#     publish_key: "pub-c-0868dcbe-2010-480e-a3a9-bd36ee424813"
# )
#
# callback = Pubnub::SubscribeCallback.new(
#     message: ->(envelope) {
#         puts "MESSAGE: #{puts envelope.result[:data][:message]}"
#     },
#     presence: ->(envelope) {
#         puts "PRESENCE: #{envelope.result[:data]}"
#     },
#     status: lambda do |envelope|
#         puts "#{envelope.status}"
#     end
# )
#
# pubnub.add_listener(callback: callback)
#
# pubnub.subscribe(
#     channels: "pubnub_onboarding_channel",
#     with_presence: true
# )
# pubnub.history(
#     channel: "pubnub_onboarding_channel",
#     count: 10
# )
#
# pubnub.publish(
#     channel: "pubnub_onboarding_channel",
#     message: { sender: 'RubySDK', content: 'Hello From Ruby SDK!' }.to_json
# )
