# == Schema Information
#
# Table name: project_stats
#
#  id           :integer          not null, primary key
#  project_id   :integer
#  appreciation :integer
#  comments     :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class ProjectStatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
