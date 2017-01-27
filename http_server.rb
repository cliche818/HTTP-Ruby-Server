# http_server.rb
require 'socket'

app = Proc.new do
  ['200', {'Content-Type' => 'text/html'}, ["Hello world! The time is #{Time.now}"]]
end

server = TCPServer.new(5678)

while true
  session = server.accept

  request = session.gets
  puts request

  response = app.call({})
  status = response[0]
  headers = response[1]
  body = response[2]

  session.print "HTTP/1.1 #{status}\r\n"

  headers.each do |key, value|
    session.print "#{key}: #{value}\r\n"
  end

  session.print "\r\n"

  session.print "Starting...."

  body.each do |part|
    session.print part
  end

  session.close
end
