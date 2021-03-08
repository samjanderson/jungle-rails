class SessionsController < ApplicationController


  def new
  end

  def create
    #this will return the user if it passes, it sets variable at same time as checking if that variable exists
    #user = this and if that value is truthy carry on
    if user = User.authenticate_with_credentials(params[:email], params[:password])
    
    # If the user exists AND the password entered is correct.
   
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      #this equals the user that we authenticated
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
