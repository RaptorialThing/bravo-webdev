class HeadhuntersController < ApplicationController
	before_action :require_headhunter_login!, only: [:destroy]
	def index	
		@jobs = Job.where("headhunter_id", current_headhunter.id)
		applies1_arr = []
		job_arr = []
		@jobs.each{ |job| job_arr.push job.id}
		job_arr = job_arr.join(',')
		job_arr = "( "+job_arr+" )"
		applies1_arr = Apply.where("applicable_type = ? and applicable_id = ?".delete("\'"),
			"Job",job_arr) 
		applies2_arr = []
		applies1_arr.each {|apply| applies2_arr.push (apply.id + 1)}
		applies2_arr = applies2_arr.join(',')
		applies2_arr = "( "+applies2_arr+" )"
		@applies = Apply.where("applicable_type = ? and applicable_id = ?".delete("\'"),
			"Worker", applies2_arr)
		workers_arr = []
		@applies.each {|apply| workers_arr.push apply.applicable_id }
		@workers = Worker.find(workers_arr)
	end	
	def new
		@Headhunter = Headhunter.new
	end	
	def create
		@Headhunter = Headhunter.new(headhunter_params)

		if @Headhunter.save
			redirect_to @Headhunter
		else
			render :new
		end	
	end	
	def show
		@Headhunter = Headhunter.find(params[:id])
	end	
	def edit
		@Headhunter = Headhunter.find(params[:id])
	end	
	def update
		@Headhunter = Headhunter.find(params[:id])

		if @Headhunter.update(headhunter_params)
			redirect_to @Headhunter
		else
			render :edit 
		end			
	end	
	private
	def headhunter_params
		params.require(:headhunter).permit(:name, :contact)
	end	
end
