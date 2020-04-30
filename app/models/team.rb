class Team < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :projects, dependent: :destroy

  scope :most_recent_first, ->{order(created_at: :desc)}

  sortables = %w(name active owner)

  sortables.each do |sortable|
    scope "ascending_#{sortable}".to_sym, ->{order("#{sortable} asc")}
    scope "descending_#{sortable}".to_sym, ->{order("#{sortable} desc")}
  end

  extend FriendlyId
  friendly_id :name, use: :slugged
end
