class TennisPerformancesController < ApplicationController
  before_action :set_user, :set_tennis_performance, only: %i[ show edit update destroy ]
  before_action :authenticate_user, only: [:update]

  def update
    respond_to do |format|
      if @tennis_performance.update(tennis_performance_params)
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

  def set_tennis_performance
    @tennis_performance = TennisPerformance.find(params[:id])
  end

  def tennis_performance_params
    params.require(:tennis_performance).permit(:tennis_frequency, :tennis_experience, :tennis_rank)
  end

  def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_user_registration_path 
      end
    end
end
