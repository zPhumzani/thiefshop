class SessionsController < ApplicationController
  def new
  	redirect_to root_path if user_signed_in?
  end

  def create
  	user = User.find_by(slug: user_params[:slug]) || User.find_by(email: user_params[:slug])

  	if user && user.authenticate(user_params[:password])
  		session[:user_id] = user.id
  		redirect_to root_path
  	else
  		flash[:alert] = "Invalid login/password"
  		redirect_to root_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path, notice: 'Sign out successfully.'
  end

  private
    def user_params
    	params.require(:user).permit(:slug, :password)
    end
end
