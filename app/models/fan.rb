class Fan < ApplicationRecord
  belongs_to :user
  has_many :subscriptions

  has_one_attached :profile_pic, dependent: :destroy

end
