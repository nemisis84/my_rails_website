class UsersController < ApplicationController


    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else 
            render :new, status: :unprocessable_entity
    
        end
    end



  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
