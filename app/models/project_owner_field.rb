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
  has_one :project

  belongs_to :field

  has_one :project_owner
end
