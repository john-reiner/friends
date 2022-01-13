
module AuthenticateUserConcern

    extend ActiveSupport::Concern

    def authenticate_user
        
        # byebug
        token = session[:token]
        
        if token
            secret_key = Rails.application.secret_key_base
            
            decoded_token = JWT.decode(token, secret_key)[0]

            @user = User.find(decoded_token["user_id"])

        else
            redirect_to new_session_path
        end

        
        # authorization_header = request.headers[:authorization]
        # if authorization_header
        # else
        #     render status: :unauthorized
        # end
    end

end