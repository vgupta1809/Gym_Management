class ExercisesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_trainer, :except => [:index, :show]
  before_action :validate_exercise_id, :except => [:index, :new, :create]

  def index
    @exercise = Exercise.all
  end

  def show
  end
  
  def new
    @type = Type.all
    @exercise = current_user.exercises.build
  end
 
  def edit
  end
  
  def update
    if @exercise.update(exercise_params)
      redirect_to exercises_path
    else
      render 'edit'
    end
  end

  def create
    @exercise = current_user.exercises.build(exercise_params)
    @exercise.video.attach(params[:exercise][:video])
    if @exercise.save
      redirect_to exercises_path
    else
      render 'new'
    end
  end

  def destroy
    @exercise.destroy
 
    redirect_to exercises_path
  end
 

  private
  
  def validate_exercise_id
    @exercise = Exercise.find_by(id: params[:id])
    if @exercise.blank?
      flash[:success] = "Not a valid Path"
      redirect_to exercises_path 
    end
  end

  def authenticate_trainer
    redirect_to exercises_path unless current_user && is_trainer?
  end
  
  def exercise_params
    params.require(:exercise).permit(:name, :description, :video, type_ids:[])
  end
end
