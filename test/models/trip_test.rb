# == Schema Information
#
# Table name: trips
#
#  id         :integer          not null, primary key
#  distance   :integer
#  trip_date  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :reference
#

require 'test_helper'

class TripTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
