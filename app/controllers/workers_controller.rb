class WorkersController < ApplicationController
	def index
	end
	def show
		@Worker = Workers.find(params[:id])
	end
end
