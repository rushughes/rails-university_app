class LoginsController < ApplicationController

  def new

  end

  def create
    student = Student.find_by(email: params[:logins][:email].downcase)
    if student && student.authenticate(params[:logins][:password])
      flash[:notice] = "Successfully logged in"
      session[:student_id] = student.id
      redirect_to student
    else
      flash.now[:notice] = "Invalid user"
      render 'new'
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:notice] = "You have logged out"
    redirect_to root_path
  end

end
