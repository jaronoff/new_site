# == Schema Information
#
# Table name: project_owner_images
#
#  id               :integer          not null, primary key
#  project_owner_id :integer
#  url              :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class ProjectOwnerImage < ActiveRecord::Base
  # Model Associations
  # ==================
  has_one :project

  has_one :project_owner
end
