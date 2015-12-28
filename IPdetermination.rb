#example command line code
#payload = 'stuff'
#spawn "echo #{payload}" => stuff

require 'rest-client'
address = Socket.getaddrinfo(Socket.gethostname, nil)[0][2]
name = Socket.gethostname
if name.include? '.' then name = name.slice(0..name.index('.') - 1) end
#WARNING 'grep' line needs to be changed to '10.10.10' for WGSOHO
payload = {:"text" => "The device #{name}'s IP Address is #{address}"}.to_json
RestClient.post 'https://hooks.slack.com/services/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', payload
