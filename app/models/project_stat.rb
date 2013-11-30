# == Schema Information
#
# Table name: project_stats
#
#  id           :integer          not null, primary key
#  project_id   :integer
#  appreciation :integer
#  comments     :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class ProjectStat < ActiveRecord::Base
  # Model Associations
  # ==================
  belongs_to :project

  validates :project_id, presence: true, uniqueness: true
end
