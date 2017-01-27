class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :load_user
  private
  def load_user
    @current_user = Yuser.find_by username: params[:user_handle]
  end

end
