class SessionsController < ApplicationController

    def new
    end

    def create

        user= User.find_by(email: session_params[:email])

        if user && user.authenticate(session_params[:password])

            secret_key = Rails.application.secret_key_base
            token = JWT.encode({user_id: user.id}, secret_key)
            session[:token] = token
            authenticate_user
            redirect_to @user

        else

            flash[:notice] = "Unable to verify email or password"
            redirect_to new_session_path

        end
    end

    def destroy
        session[:token] = nil
        flash[:notice] = "You have been signed out successfully!"
        redirect_to new_session_path
    end

    private

    def session_params
        session_params = params.permit(:email, :password)
    end

end
