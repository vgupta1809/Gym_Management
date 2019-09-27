class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_trainer, :except => [:index, :show]
  before_action :validate_workout_id, :except => [:index, :new, :create]  
  
  def index
    if current_user.admin?
      #@workout = Workout.all
      @workout  = Workout.paginate(:page => params[:page], :per_page=>5)
    else 
      @workout = current_user.workouts
    end
  end

  def show
  end

  def new
    @exercises = Exercise.all
    @workout = current_user.workouts.build
  end

  def edit
    @exercises = Exercise.all
  end

  def update
    if @workout.update(workout_params)
      redirect_to workouts_path
    else
      render 'edit'
    end
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      redirect_to workouts_path
    else
      render 'new'
    end
  end

  def destroy   
    @workout.destroy
    redirect_to workouts_path
  end

  private

  def validate_workout_id
    @workout = Workout.find_by(id: params[:id])
    redirect_to workouts_path if @workout.blank?
  end

  def authenticate_trainer
    redirect_to workouts_path unless current_user && is_trainer?
  end

  def workout_params
    params.require(:workout).permit(:name, :description, exercise_ids:[])
  end
end
