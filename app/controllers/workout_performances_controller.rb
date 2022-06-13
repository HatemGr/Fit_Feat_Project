class WorkoutPerformancesController < ApplicationController
  before_action :set_user, :set_workout_performance, only: %i[ show edit update destroy ]
  before_action :authenticate_user, only: [:update]

  def update
    respond_to do |format|
      if @workout_performance.update(workout_performance_params)
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

  def set_workout_performance
    @workout_performance = WorkoutPerformance.find(params[:id])
  end

  def workout_performance_params
    params.require(:workout_performance).permit(:workout_frequency, :workout_experience, :workout_benchpress_weight, :workout_squat_weight)
  end

  def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_user_registration_path 
      end
    end
end
