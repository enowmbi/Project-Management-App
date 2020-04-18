class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  # belongs_to :user, counter_cache: true
  belongs_to :team
  accepts_nested_attributes_for :tasks,reject_if: :all_blank,allow_destroy: true

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :status, presence: true

  default_scope ->{order(created_at: :desc)}
end
