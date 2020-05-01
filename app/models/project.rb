class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :team, counter_cache: true

  has_rich_text :description

  validates :name, presence: true
  validates :name, uniqueness: true

  scope :all_projects, ->(team){where(team_id: team.id)}
  scope :most_recent_first, ->{order(created_at: :desc)} 

  sortables = %w(name due_date active complete tasks_count)

  sortables.each do |sortable|
    scope "ascending_#{sortable}".to_sym, ->{order("#{sortable} asc")}
    scope "descending_#{sortable}".to_sym, ->{order("#{sortable} desc")}
  end

  extend FriendlyId
  friendly_id :name, use: :slugged
end
