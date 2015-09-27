require 'sinatra'

get '/' do
	File.read('coroboco-web/index.html')
end
