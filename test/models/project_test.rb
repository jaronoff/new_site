# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  behance_id   :integer
#  name         :string(255)
#  description  :text
#  published_on :integer
#  created_on   :integer
#  modified_on  :integer
#  url          :string(255)
#  privacy      :string(255)
#  for_sale     :float
#  url_name     :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
