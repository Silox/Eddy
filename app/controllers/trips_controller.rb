# == Schema Information
#
# Table name: trips
#
#  id                :integer          not null, primary key
#  trip_date         :date             not null
#  route_id          :integer
#  user_id           :integer          not null
#  alias             :string           not null
#  distance_in_meter :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class TripsController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :trip, through: :user

  def index
  end

  def create
    @trip.save
  end

  def edit
  end

  def update
    @trip.update trip_params
  end

  def destroy
    @trip.destroy
  end

  private

  def trip_params
    params.require(:trip).permit(:trip_date, :alias, :distance_in_kilometer)
  end
end
