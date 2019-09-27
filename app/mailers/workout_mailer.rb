class WorkoutMailer < ApplicationMailer
  def new_workout_email
    @user = params[:user]
    mail(to: "#{@user.email}", subject: "You got a new Workout!")
  end
end
