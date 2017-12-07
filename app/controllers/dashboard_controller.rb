class DashboardController < ApplicationController

  def show
    @user = Dashboard.find_by(user_id: current_user.id)
  end

end