class Workout < ApplicationRecord
  # to find normal users workout
  has_many :users_workouts
  has_many :users, through: :users_workouts , dependent: :destroy

  #belongs_to :trainer, class_name: 'User', foreign_key: 'user_id'

  has_many :exercises_workouts
  has_many :exercises, through: :exercises_workouts, dependent: :destroy
end
