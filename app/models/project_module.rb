# == Schema Information
#
# Table name: project_modules
#
#  id         :integer          not null, primary key
#  project_id :integer
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class ProjectModule < ActiveRecord::Base
  belongs_to :project
end
