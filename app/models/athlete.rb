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

  def self.ransackable_attributes(auth_object = nil)
    ["bio", "created_at", "sport_id", "id", "name", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["campaigns", "fans", "panorama_pic_attachment", "panorama_pic_blob", "posts", "profile_pic_attachment", "profile_pic_blob", "sport", "user"]
  end

end
