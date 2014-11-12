# == Schema Information
#
# Table name: project_owners
#
#  id         :integer          not null, primary key
#  behance_id :integer
#  first_name :string(255)
#  last_name  :string(255)
#  username   :string(255)
#  city       :string(255)
#  state      :string(255)
#  country    :string(255)
#  company    :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ProjectOwnerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
