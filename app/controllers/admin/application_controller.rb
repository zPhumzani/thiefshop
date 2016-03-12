class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  def index
  end


  protected

  def authenticate_admin!
  	authenticate_user!
  	@message = "This ain't cool #{current_user}, You are trying to hack us. If you do that again you will lose your account"
  	redirect_to root_path, alert: @message unless current_user.admin?
  end

end
