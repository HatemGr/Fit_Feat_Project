class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]
    before_action :authenticate_user, only: [:update]

    def index
        @users = User.all
    end

    def show
    end

    def update 
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to user_path(@user) }
          format.json { }
        else
          format.html { redirect_to edit_user_path(@user) }
          format.json { }
        end
      end
    end

    private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :encrypted_password, :description, :first_name, :last_name, :address, :birthdate)
    end

    def authenticate_user
        unless current_user
          flash[:danger] = "Please log in."
          redirect_to new_user_registration_path 
        end
      end

end
