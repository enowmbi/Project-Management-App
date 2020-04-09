class Task < ApplicationRecord
  belongs_to :project
  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments


  validates :title, presence: true
  validates :title, uniqueness: {scope: :project_id}
  validates :description, presence: true
  validates :priority, presence: true
  validates :status, presence: true
end
