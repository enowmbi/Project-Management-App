class Task < ApplicationRecord
  belongs_to :project, counter_cache: true
  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments


  validates :title, presence: true
  validates :title, uniqueness: {scope: :project_id}
  validates :priority, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_rich_text :description

  scope :all_tasks, ->(project){where(project_id: project.id)}
  scope :ascending_title, ->{order(title: :asc)}
  scope :descending_title, ->{order(title: :desc)}
  scope :ascending_priority, ->{order(priority: :asc)}
  scope :descending_priority, ->{order(priority: :desc)}
  scope :ascending_status, ->{order(complete: :asc)}
  scope :descending_status, ->{order(complete: :desc)}
end
