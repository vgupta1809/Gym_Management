class UsersWorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_trainer
  
  def new
    @workouts = current_user.workouts
    @users = User.where(:admin => false)
  end

  def create 
    @user = User.find(params[:user])
    redirect_to workouts_path if @user.blank?
    @workout_ids = params[:user_workout][:workout_ids]
   
    @workout_ids.each do |w|
      next if w.blank?
      @user_workout = @user.users_workouts.new(workout_id: w)
      @user_workout.save
    end
    WorkoutMailer.with(user: @user).new_workout_email.deliver_later

    redirect_to workouts_path      
  end

  private

  def authenticate_trainer
    redirect_to workouts_path unless current_user && is_trainer?
  end

  def user_workout_params
    params.require(:user_workout).permit(workout_ids:[])
  end

end
