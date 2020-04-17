class Team < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :projects, dependent: :destroy

  accepts_nested_attributes_for :projects, allow_destroy: true,reject_if: :all_blank

  default_scope ->{order(created_at: :desc)}

end
