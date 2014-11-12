# == Schema Information
#
# Table name: project_owner_images
#
#  id               :integer          not null, primary key
#  project_owner_id :integer
#  url              :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

require 'test_helper'

class ProjectOwnerImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
