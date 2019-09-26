class Exercise < ApplicationRecord
  has_and_belongs_to_many :types

  has_many :exercises_workouts
  has_many :workouts, through: :exercises_workouts, dependent: :destroy
  
  belongs_to :user
  
  has_one_attached :video
  validate :correct_video_mime_type
  
  validates :name, :description, :video, presence: true

  private

  def correct_video_mime_type
    if video.attached? && !video.content_type.in?(%w(video/mp4))
      errors.add(:video, 'Must be a Video')
    end
  end
  
end
