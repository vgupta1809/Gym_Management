class ApplicationController < ActionController::Base

  private

  def is_trainer?
    current_user.try(:admin?)
  end
end
