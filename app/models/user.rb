class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :exercises
  
  # to get the trainer workouts
  #has_many :trainer_workouts, class_name: 'Workout', foreign_key: 'user_id'
  
  # to find normal users workout
  has_many :users_workouts
  has_many :workouts, through: :users_workouts , dependent: :destroy
end
