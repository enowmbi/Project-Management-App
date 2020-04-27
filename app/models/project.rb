class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :team, counter_cache: true

  has_rich_text :description

  validates :name, presence: true
  validates :name, uniqueness: true

  default_scope ->{order(created_at: :desc)}

  extend FriendlyId
  friendly_id :name, use: :slugged
end
