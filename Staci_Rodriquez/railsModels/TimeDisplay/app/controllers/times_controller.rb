class TimesController < ApplicationController
	def main
		@time = Time.now.strftime("at %H:%M%p")
		@date = Time.now.strftime("%m/%d/%Y")
		render 'index.html.erb'
	end
end
