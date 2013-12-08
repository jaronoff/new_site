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

class ProjectOwner < ActiveRecord::Base
  # Model Associations
  # ==================
  belongs_to :project

  has_many :project_owner_fields

  has_many :project_owner_images

  validates :behance_id, uniqueness: true, presence: true
end
