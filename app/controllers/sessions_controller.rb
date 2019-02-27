class SessionsController < ApplicationController
    
  def create
    @user = User.find_by(email: params[:email].downcase)
    if @user && @user.authenticate(params[:password]) 
      session[:user_id] = @user.id
      redirect_to "/users/#{current_user.id}/favorites", notice: 'Successfully signed in.'
    else
      flash.now.alert = 'Incorrect email or password, please try again.'
      render :new
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to '/home', notice: 'You have been successfully signed out.'
  end
end