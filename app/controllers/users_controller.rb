class UsersController < ApplicationController
  before_filter :authorize

  def index
    @users = User.all
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    authorize! :read, @user
  end

  private

  def authorize
    if current_user.nil?
      redirect_to login_path, alert: "Not authorized"
      #as redirect you do not have to specify flash[], just pass message as second parameter
    end
  end
end
