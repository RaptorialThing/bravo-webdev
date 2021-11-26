# frozen_string_literal: true

class Headhunters::SessionsController < Devise::SessionsController
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
      headhunter = Headhunter.find_by(email: params[:email])
      # finds existing user, checks to see if user can be authenticated
      if headhunters.present? && headhunter.authenticate(params[:password])
      # sets up user.id sessions
        session[:headhunter_id] = headhunter.id
        redirect_to root_path, notice: 'Logged in successfully'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    end
    def destroy
      # deletes user session
      session[:headhunter_id] = nil
      redirect_to root_path, notice: 'Logged Out'
    end
end
