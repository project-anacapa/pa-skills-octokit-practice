class CallbacksController < Devise::OmniauthCallbacksController
    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        @user.access_token = request.env["omniauth.auth"]['credentials']['token']
        @user.save
        
        sign_in_and_redirect @user
    end
end
