# == Schema Information
#
# Table name: project_fields
#
#  id         :integer          not null, primary key
#  field_id   :integer
#  project_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class ProjectField < ActiveRecord::Base
  # Model Associations
  # ==================
  belongs_to :project

  belongs_to :field

  validates_uniqueness_of :project_id, scope: :field_id
end
