# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  behance_id   :integer
#  name         :string(255)
#  description  :text
#  published_on :integer
#  created_on   :integer
#  modified_on  :integer
#  url          :string(255)
#  privacy      :string(255)
#  for_sale     :float
#  url_name     :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Project < ActiveRecord::Base

  # Model Associations
  # ==================

  has_many :project_ownerships, dependent: :destroy

  has_many :project_owners, through: :project_ownerships, dependent: :destroy

  has_many :project_fields, dependent: :destroy

  has_one :project_module

  has_one :project_stat, dependent: :destroy

  has_one :project_cover, dependent: :destroy

  accepts_nested_attributes_for :project_module


  # Model Validations
  # ==================
  validates :behance_id, uniqueness: true, presence: true

  before_save :create_url_name

  def create_url_name
    if self.name.present?
      self.url_name = self.name.split(' ').map { |word| word.downcase.gsub(/\W/, '') }.join('-')
    end
  end

  # Class Methods
  # =============
  def self.with_includes
    # This will include all the associated models we need to improve performance of database scouring
    self.includes([:project_cover, :project_owners, :project_fields, :project_stat, :project_module])
        .includes([:project_owners => :project_owner_fields, :project_owners => :project_owner_images])
        .includes([:project_fields => :field])
  end
end


