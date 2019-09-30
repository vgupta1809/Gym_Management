class WorkoutMailer < ApplicationMailer
  def new_workout_email(url)
    @user = params[:user]
    @link = url
    mail(to: "#{@user.email}", subject: "You got a new Workout!")
  end
end
