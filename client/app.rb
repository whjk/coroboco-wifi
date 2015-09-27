require 'sinatra'

set :public_folder, 'coroboco-web'

get '/' do
	redirect '/index.html'
end

get '/key/:key' do

end
