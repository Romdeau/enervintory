# == Schema Information
#
# Table name: softwares
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  serial     :string(255)
#  notes      :string(255)
#  item_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class SoftwareTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
