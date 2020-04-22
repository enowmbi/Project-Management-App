class Team < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :projects, dependent: :destroy

  default_scope ->{order(created_at: :desc)}


  extend FriendlyId
  friendly_id :name
end
