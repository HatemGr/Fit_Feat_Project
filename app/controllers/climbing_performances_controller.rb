class ClimbingPerformancesController < ApplicationController
  before_action :set_user, :set_climbing_performance, only: %i[ show edit update destroy ]
  before_action :authenticate_user, only: [:update]

  def update
    respond_to do |format|
      if @climbing_performance.update(climbing_performance_params)
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

  def set_climbing_performance
    @climbing_performance = ClimbingPerformance.find(params[:id])
  end

  def climbing_performance_params
    params.require(:climbing_performance).permit(:climbing_frequency, :climbing_experience, :climbing_block_color, :climbing_level)
  end

  def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_user_registration_path 
      end
    end
end
