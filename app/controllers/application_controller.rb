class ApplicationController < ActionController::Base
  before_action :require_login

  helper_method :current_users_list
  protected
  def current_users_list
    User.get_current_users.map {|u| u.name}.join(", ")
  end

  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
