class Athlete < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_pic, dependent: :destroy
  has_one_attached :panorama_pic, dependent: :destroy

end
