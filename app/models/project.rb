class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :team, counter_cache: true
  accepts_nested_attributes_for :tasks,reject_if: :all_blank,allow_destroy: true

  has_rich_text :description

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :status, presence: true

  default_scope ->{order(created_at: :desc)}

  extend FriendlyId
  friendly_id :name, use: :slugged
end
