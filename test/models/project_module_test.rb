# == Schema Information
#
# Table name: project_modules
#
#  id           :integer          not null, primary key
#  project_id   :integer
#  content_type :string(255)
#  content      :text
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class ProjectModuleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
