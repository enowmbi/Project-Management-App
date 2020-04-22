class Task < ApplicationRecord
  belongs_to :project, counter_cache: true
  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments


  validates :title, presence: true
  validates :title, uniqueness: {scope: :project_id}
  validates :description, presence: true
  validates :priority, presence: true
  validates :status, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged
end
