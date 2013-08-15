require 'sinatra/base'
require 'redcarpet'

module Fluxr
  class Server < Sinatra::Application
  	get '/' do
  		@slides = settings.slides
		haml :index
	end
  end
end