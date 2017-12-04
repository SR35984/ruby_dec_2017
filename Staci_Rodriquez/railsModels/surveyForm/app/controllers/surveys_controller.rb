class SurveysController < ApplicationController
	def index
		session[:views] ||= 0
		render 'survey'
	end

	def process_survey
		session[:views] = session[:views] + 1
		session[:result] = params[:survey]
		flash[:success] = "Thanks for submitting this form! You have submitted this form #{ session[:views]} time(s) now."
		puts session[:result]
		redirect_to '/surveys/result'
	end

	def result
		@result = session[:result]
		render 'result'
	end
end