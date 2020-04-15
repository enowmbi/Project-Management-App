class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user
  belongs_to :team

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :duration, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  validates :status, presence: true
end
