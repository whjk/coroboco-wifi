class CoRoboCo
	attr_reader :ip

	def initialize(ip)
		@ip = ip
		@socket = TCPSocket.new(ENV['CORO_SERVER'], ENV['CORO_PORT'])
	end

	def master?
		@socket.puts("master?")
		resp = @socket.recvfrom(1024)[0]
		(resp == "yes").to_s
	end

	def do_action(action)
		@socket.puts("#{action}")
	end
end
