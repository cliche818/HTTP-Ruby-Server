require 'socket'

server = TCPSocket.new('localhost', 5678)

line = server.gets

puts line

server.close
