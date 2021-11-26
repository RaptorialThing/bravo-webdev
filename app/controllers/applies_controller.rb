class AppliesController < ApplicationController
	before_action :require_worker_login!, only: [:index, :new, :create]
	def index
		@worker = Worker.find(current_worker.id)
		@applies = @worker.applies
	end
	def new
		@worker = Worker.find(current_worker.id)
		@apply = @worker.applies.new
	end
	def create
		@worker = Worker.find(current_worker.id)
		@apply = @worker.applies.new
		@job = Job.find(params[:job_id])
		@apply2 = Apply.new
		@apply2.applicable = @job
		if @apply.save and @apply2.save
			flash[:notice] = "Successfull save apply"
			redirect_to workers_path
		else
			flash[:notice] = "Error saving apply"
			rendirect_to workers_path
		end		
	end
end
