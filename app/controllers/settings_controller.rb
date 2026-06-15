class SettingsController < ApplicationController
  before_action :authenticate_user!

  def theme
    current_user.update!(
      theme: params[:theme]
    )

    redirect_back(
      fallback_location: dashboard_path,
      notice: "Theme updated successfully."
    )
  end
end
