# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  behance_id   :integer
#  name         :string(255)
#  published_on :integer
#  created_on   :integer
#  modified_on  :integer
#  url          :string(255)
#  privacy      :string(255)
#  for_sale     :float
#  created_at   :datetime
#  updated_at   :datetime
#

class Project < ActiveRecord::Base

  # Model Associations
  # ==================
  has_many :project_covers

  has_many :project_owners

  has_many :project_fields

  has_many :project_owner_fields

  has_many :project_owner_images

  has_one :project_stat
end


