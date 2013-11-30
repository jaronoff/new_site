# == Schema Information
#
# Table name: project_owner_fields
#
#  id               :integer          not null, primary key
#  project_owner_id :integer
#  field_id         :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class ProjectOwnerField < ActiveRecord::Base
  # Model Associations
  # ==================
  belongs_to :project

  belongs_to :field

  belongs_to :project_owner

  validates_uniqueness_of :project_owner_id, scope: :field_id

end
