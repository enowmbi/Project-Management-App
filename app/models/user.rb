class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :assignments, dependent: :destroy
  has_many :tasks, through: :assignments
  has_many :memberships
  has_many :teams, through: :memberships
  has_many :projects


  def full_name
   self.first_name + " " +  self.last_name
  end

end
