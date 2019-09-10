class SessionController < ApplicationController

    # Allows us to make a new user into the database
  def new
    @user = User.new
  end

    # Allows us to create a new user within the database
  def create
      # find the user by their email address
    user = User.find_by :email => params[:email] # Users are accessable for Emails within the user table
    # encrypted password matches the encryped password in the database
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id # matches the session user id with user id within the database
      flash[:notice] = "User created!" # Flashing message for when A user is successfully created
      redirect_to root_path
    else
      flash[:error_message] = "Invalid email or password"
      redirect_to login_path # redirects us to the login Path
    end
  end

    # Creating this def allows us to delete a user from the user table
  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
