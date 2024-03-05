class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def show
      # @user = User.find(params[:user_id])
      @user = current_user
    end
  
    def edit
      @user = current_user
    end
  
    def update
      @user = current_user
      if @user.update(user_params)
        redirect_to user_path(@user), notice: 'アカウント情報が更新されました。'
      else
        render :edit
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :introduction)
    end
  end
  