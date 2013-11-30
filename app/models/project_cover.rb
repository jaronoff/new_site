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

class ProjectCover < ActiveRecord::Base
  # Model Associations
  # ==================
  belongs_to :project

  validates_uniqueness_of :project_id, scope: :url
end
