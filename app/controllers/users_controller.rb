class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def create
      user = User.new(user_params)
      user.first_name = "Johnny"
  
      if user.save
      else
      end
    end
  
    def update
      user = User.find(params[:id])
  
      user.first_name = "Johnny"
  
      if user.update(user_params)
      else
      end
    end
  
    private
  
    def user_params
        params.require(:user).permit(:first_name, :last_name, :username)
      end
    
      def set_user
        @user = User.find(params[:id])
      end
    end
    