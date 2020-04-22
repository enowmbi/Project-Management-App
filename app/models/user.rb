class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :assignments, dependent: :destroy
  has_many :tasks, through: :assignments
  has_many :memberships
  has_many :teams, through: :memberships
  has_many :projects

  extend FriendlyId
  friendly_id :full_name, use: :slugged

  def full_name
   self.first_name + " " +  self.last_name
  end

  def gravatar_url
     stripped_email = self.email.strip
     downcased_email = stripped_email.downcase
     email_hash = Digest::MD5.hexdigest(downcased_email)
     "http://gravatar.com/avatar/#{email_hash}"
  end

end
