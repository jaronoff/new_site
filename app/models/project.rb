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

  has_many :project_ownerships

  has_many :project_owners, through: :project_ownerships

  has_many :project_fields

  has_one :project_stat

  # Model Validations
  # ==================
  validates :behance_id, uniqueness: true, presence: true

  # Class Methods
  # =============
  def self.with_includes
    # This will include all the associated models we need to improve performance of database scouring
    self.includes([:project_covers, :project_owners, :project_fields, :project_stat])
        .includes([:project_owners => :project_owner_fields, :project_owners => :project_owner_images])
        .includes([:project_fields => :field])
  end
end


