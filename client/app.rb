require 'sinatra'

set :public_folder, 'coroboco-web'

get '/' do
	redirect '/index.html'
end

get '/key/:key' do
	coroboco = CoRoboCo.new(request.ip)

	coroboco.do_action(params['key'])

	return coroboco.master?
end

