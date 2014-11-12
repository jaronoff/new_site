# == Schema Information
#
# Table name: project_ownerships
#
#  id               :integer          not null, primary key
#  project_owner_id :integer
#  project_id       :integer
#  created_at       :datetime
#  updated_at       :datetime
#

require 'test_helper'

class ProjectOwnershipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
