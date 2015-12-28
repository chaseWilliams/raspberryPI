#example command line code
#payload = 'stuff'
#spawn "echo #{payload}" => stuff

require 'rest-client'
address = `ifconfig | grep "192.168.100" | awk {'print $2'}`
#WARNING 'grep' line needs to be changed to '10.10.10' for WGSOHO
payload = {:"text" => "The Raspberry PI IP Address is #{address}"}.to_json
RestClient.post 'https://hooks.slack.com/services/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', payload
puts "My IP address is #{address}"
