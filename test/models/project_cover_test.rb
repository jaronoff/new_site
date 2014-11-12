# == Schema Information
#
# Table name: project_covers
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  project_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ProjectCoverTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
