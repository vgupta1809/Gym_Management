# Preview all emails at http://localhost:3000/rails/mailers/workout_mailer
class WorkoutMailerPreview < ActionMailer::Preview
  def new_workout_email
    # Set up a temporary order for the preview
    #order = Order.new(name: "Joe Smith", email: "joe@gmail.com", address: "1-2-3 Chuo, Tokyo, 333-0000", phone: "090-7777-8888", message: "I want to place an order!")
    
    user = User.second

    WorkoutMailer.with(user: user).new_workout_email
  end
end
