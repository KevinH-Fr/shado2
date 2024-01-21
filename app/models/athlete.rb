class Athlete < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_pic, dependent: :destroy
  has_one_attached :panorama_pic, dependent: :destroy

  def default_profile_pic
    if profile_pic.attached?
      profile_pic
    else
      'profile_default.png'
    end
  end

  def default_panorama_pic
    if panorama_pic.attached?
      panorama_pic
    else
      'panorama_default.jpg'
    end
  end

end
