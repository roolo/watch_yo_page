class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :load_user

  private

  def load_user
    @current_user = Yuser.find_by username: user_param
  end

  def user_param
    params.require(:username)
  end

end
