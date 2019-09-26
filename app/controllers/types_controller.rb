class TypesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_trainer
  before_action :validate_type_id, :except => [:index, :new, :create]  

  def index
    @type = Type.all
  end
  
  def show
  end
  
  def new
    @type = Type.new
  end
 
  def edit
  end
  
  def update
    if @type.update(type_params)
      redirect_to types_path
    else
      render 'edit'
    end
  end

  def create
    @type = Type.new(type_params)
    if @type.save
      redirect_to types_path
    else
      render 'new'
    end
  end

  def destroy
    @type.destroy
    redirect_to types_path
  end

  
  private

  def validate_type_id
    @type = Type.find_by(id: params[:id])
    redirect_to types_path if @type.blank?
  end
  
  def authenticate_trainer
    redirect_to workouts_path unless current_user && is_trainer?
  end
  
  def type_params
    params.require(:type).permit(:name, :description)
  end

end
