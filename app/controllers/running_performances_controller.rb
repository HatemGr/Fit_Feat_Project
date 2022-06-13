class RunningPerformancesController < ApplicationController
  before_action :set_user, :set_running_performance, only: %i[ show edit update destroy ]
  before_action :authenticate_user, only: [:update]

  def update
    respond_to do |format|
      if @running_performance.update(running_performance_params)
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

  def set_running_performance
    @running_performance = RunningPerformance.find(params[:id])
  end

  def running_performance_params
    params.require(:running_performance).permit(:running_frequency, :running_experience, :running_distance, :running_speed)
  end

  def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_user_registration_path 
      end
    end

end
