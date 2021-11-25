class HeadhuntersController < ApplicationController
	def index	
	end	
	def show
		@Headhunter = Headhunter.find(params[:id])
	end	
end
