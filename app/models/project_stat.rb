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
  has_one :project
end
