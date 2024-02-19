class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_voter

  has_many :notifications, as: :recipient, dependent: :destroy

  scope :all_except, -> (user) {where.not(id: user)}
  
  after_create_commit { broadcast_append_to 'users' }

  has_many :messages

end
