class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable, :invitable

  has_many :assignments, dependent: :destroy
  has_many :tasks, through: :assignments
  has_many :memberships
  has_many :teams, through: :memberships
  has_many :projects

  extend FriendlyId
  friendly_id :name, use: :slugged

  protected
  def password_required?
    confirmed? ? super : false
  end

end
