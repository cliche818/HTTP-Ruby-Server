require 'socket'

server = TCPSocket.new('localhost', 5679)

puts server

while line = server.gets
  puts line
end

server.close
