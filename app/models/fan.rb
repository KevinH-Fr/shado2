class Fan < ApplicationRecord
  belongs_to :user
  has_many :subscriptions

  has_one_attached :profile_pic, dependent: :destroy

  has_many :campaigns, through: :subscriptions
  has_many :athletes, through: :campaigns

end
