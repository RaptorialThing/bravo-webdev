# frozen_string_literal: true

class Workers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
   def create
      worker = Worker.find_by(email: params[:email])
      # finds existing user, checks to see if user can be authenticated
      if worker.present? && worker.authenticate(params[:password])
      # sets up user.id sessions
        session[:worker_id] = worker.id
        redirect_to root_path, notice: 'Logged in successfully'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    end
    def destroy
      # deletes user session
      session[:worker_id] = nil
      redirect_to root_path, notice: 'Logged Out'
    end
end
