class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :authenticate_user!

  helper_method :theme_class

  rescue_from Pundit::NotAuthorizedError do
    redirect_to dashboard_path,
                alert: "You are not authorized to perform this action."
  end

  protected

  def after_sign_in_path_for(_resource)
    dashboard_path
  end

  def theme_class
    return "theme-light" unless user_signed_in?

    current_user.dark? ? "theme-dark" : "theme-light"
  end
end
