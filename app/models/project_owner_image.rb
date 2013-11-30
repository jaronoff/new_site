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
  belongs_to :project

  belongs_to :project_owner

  validates_uniqueness_of :project_owner_id, scope: :url
end
