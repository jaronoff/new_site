# == Schema Information
#
# Table name: project_ownerships
#
#  id               :integer          not null, primary key
#  project_owner_id :integer
#  project_id       :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class ProjectOwnership < ActiveRecord::Base
  belongs_to :project

  belongs_to :project_owner

  validates :project_id, uniqueness: {scope: :project_owner_id}
end
