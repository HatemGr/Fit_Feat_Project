class FutsalPerformancesController < ApplicationController
  before_action :set_user, :set_futsal_performance, only: %i[ show edit update destroy ]
  before_action :authenticate_user, only: [:update]

  def update
    respond_to do |format|
      if @futsal_performance.update(futsal_performance_params)
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
    @user = User.find(params[:user_id])
  end

  def set_futsal_performance
    @futsal_performance = FutsalPerformance.find(params[:id])
  end

  def futsal_performance_params
    params.require(:futsal_performance).permit(:futsal_frequency, :futsal_experience)
  end

  def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_user_registration_path 
      end
    end
end
