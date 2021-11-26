class ApplicationController < ActionController::Base
	before_action :set_current_user
	def set_current_user
		Current.headhunter = Headhunter.find_by(id: session[:headhunter_id]) if session[:headhunter_id]
		Current.worker = Worker.find_by(id: session[:worker_id]) if session[:worker_id]
	end	
	def require_headhunter_login!
		redirect_to new_headhunter_session_path, alert: "You must be logged in" if current_headhunter.nil?
	end	
	def require_worker_login!
		redirect_to new_worker_session_path, alert: "You must be logged in" if current_worker.nil?
	end	
end
