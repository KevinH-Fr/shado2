class Campaign < ApplicationRecord
  belongs_to :athlete

  has_many :subscriptions
  has_many :fans, through: :subscriptions

  has_one_attached :panorama_pic, dependent: :destroy


  def default_panorama_pic
    if panorama_pic.attached?
      panorama_pic
    else
      'panorama_default.jpg'
    end
  end

  def thank_you_note
    self.thankyounote = "Thanks a lot for donating!" if thankyounote.blank?
  end
  
end
