class WorkersController < ApplicationController
	before_action :require_worker_login!, only: [:destroy, :show, :index, :edit]
	def index
		@jobs = Job.all
	end
	def new
		@Worker = Worker.new
	end	
	def create
		@Worker = Worker.new(worker_params)

		if @Worker.save
			redirect_to @Worker
		else
			render :new
		end	
	end	
	def show
		@Worker = Worker.find(params[:id])
	end
	def edit
		@Worker = Worker.find(params[:id])
	end	
	def update
		@Worker = Worker.find(params[:id])

		if @Worker.update(worker_params)
			redirect_to @Worker
		else
			render :edit 
		end			
	end		
	def applies
		@worker = Worker.find(params[:id])
		@applies = Apply.where("applicable_type = ? and applicable_id = ?",
			"Worker",@worker.id)
		applies_arr = []
		apply_jobs_arr = []
		@applies.each {|apply| applies_arr.push apply.id; apply_jobs_arr.push (apply.id - 1) }
		apply_jobs = Apply.find(apply_jobs_arr)
		jobs_arr = []
		apply_jobs.each {|apply| jobs_arr.push apply.applicable_id }
		@jobs = Job.find(jobs_arr)
	end	
	private
	def worker_params
		params.require(:worker).permit(:name, :contact)
	end	
end
