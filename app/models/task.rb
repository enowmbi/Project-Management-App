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

  scope :most_recent_first, ->{order(created_at: :desc)}
  
  sortables = %w(title priority complete due_date)

  sortables.each do |sortable|
     scope "ascending_#{sortable}".to_sym, ->{order("#{sortable} asc")}
     scope "descending_#{sortable}".to_sym, ->{order("#{sortable} desc")}
  end
end
