class JobsController < ApplicationController
	before_action :require_headhunter_login!, only: [:show,:new,:destroy]
	def index

	end	
	def show
		@job = Job.find(params[:id])
	end
	def new
		@headhunter = Headhunter.find(current_headhunter.id)
		@job = @headhunter.jobs.new
		@job.status = 0
	end	
	def create
		@headhunter = Headhunter.find(current_headhunter.id)

		@job = @headhunter.jobs.new(job_params)

		if @job.save
			redirect_to @job
		else
			render :new	
		end	
	end	
	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to root_path
	end	
	def edit
		@job = Job.find(params[:id])
	end	
	def update
		@job = Job.find(params[:id])

		if @job.update(job_params)
			redirect_to @job
		else
			render :edit
		end		
	end	
	private
	def job_params
		params.require(:job).permit(:title, :description)
	end	
end
