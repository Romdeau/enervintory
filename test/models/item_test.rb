# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  serial       :string(255)
#  name         :string(255)
#  manufacturer :string(255)
#  ubt_serial   :string(255)
#  description  :string(255)
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
