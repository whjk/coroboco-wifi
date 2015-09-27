class CoRoboCo
	attr_reader :ip

	def initialize(ip)
		@ip = ip
		@socket = TCPSocket.new(ENV['CORO_SERVER'], ENV['CORO_PORT'])
	end

	def master?
		@socket.puts("#{ip} master?")
		@socket.gets == "yes" 
	end

	def do_action(action)
		@socket.puts("#{ip} #{action}")
	end
end
