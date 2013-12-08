# == Schema Information
#
# Table name: fields
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Field < ActiveRecord::Base
  has_many :project_owner_fields
  has_many :project_fields

  validates :name, presence: true, uniqueness: true
end
