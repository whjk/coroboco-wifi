require 'sinatra'
require_relative 'coroboco'

set :public_folder, 'coroboco-web'
set :port, 8081

get '/' do
	redirect '/index.html'
end

get '/key/:key' do
	coroboco = CoRoboCo.new(request.ip)

	coroboco.do_action(params['key'])

	return coroboco.master?
end

