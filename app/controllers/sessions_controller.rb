class SessionsController < ApplicationController
  def new
  end
  def create
  	user = User.find_by(email: params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		redirect_to user
  		flash[:success] = "Logged in succesfully"
  		#
  	else
  		flash.now[:danger] = "Invalid email/password authentication"
  		render 'new'
  	end
  end
  def show
  end
  def destroy
  	log_out
  	redirect_to root_url
  end
end
