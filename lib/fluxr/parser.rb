module Fluxr
  class Parser
  	attr_accessor :slides

  	def initialize
  		@slides = []
  	end

  	def slide(title)
  	  content = yield if block_given?
  	  slides.push Slide.new(title, content)
  	end

    def parse(text)
    	instance_eval(text)
    end
  end
end