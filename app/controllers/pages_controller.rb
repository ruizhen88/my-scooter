class PagesController < ApplicationController
  # *** LOGIN OPTION ***
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def my_scooters
    @scooters = Scooter.where(user: current_user)
    @scooters_users = User.find(current_user.id).scooters
  end
end
