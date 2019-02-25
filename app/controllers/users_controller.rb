class UsersController < ApplicationController
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
     @user.email.downcase!
     if @user.save
       session[:user_id] = @user.id 
       redirect_to user_path(@user)
       flash[:notice] = "Successfully created account for #{@user.name}!"
     else
       flash[:alert] = 'Oops, could not create account. Please use a valid email and password and try again.'
       render :new
     end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end