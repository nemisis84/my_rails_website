class SessionsController < ApplicationController

    def create
        @user = User.find_by(username: params[:username])
        #Authanticate user credantials

        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            message = "Username or password is wrong"
            redirect_to login_path, notice: message
        end

    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

end
