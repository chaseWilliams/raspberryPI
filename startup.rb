#sends a message to slack using incoming-webhook that identifies that
#host machine's name and ip address.
#then it starts the rails app
require 'rest-client'
address = Socket.ip_address_list.detect {|x| x.ipv4_private?}.ip_address #ip adress
name = Socket.gethostname
if name.include? '.' then name = name.slice(0..name.index('.') - 1) end #pretties the hostname
payload = {text: "*Device:* `#{name}`\n *IP:* `#{address}`"}.to_json #convert into JSON
RestClient.post 'https://hooks.slack.com/services/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', payload #send!
`cd /home/pi/Documents/coding/raspberryPI/weatherStation; rails server -b #{address} -d` #starts up the server upon startup.
