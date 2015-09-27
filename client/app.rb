require_relative 'robot_actions'
require 'sinatra'

set :public_folder, 'coroboco-web'

get '/' do
	redirect '/index.html'
end

get '/key/:key' do
	master? && do_action(params['key'])
end

get '/master' do
	master?
end
