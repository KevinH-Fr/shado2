class Campaign < ApplicationRecord
  belongs_to :athlete

  has_many :subscriptions
  has_many :fans, through: :subscriptions

  has_one_attached :panorama_pic, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :target, presence: true, if: -> { principale == false }


  def default_panorama_pic
    if panorama_pic.attached?
      panorama_pic
    else
      'campaign_default.jpg'
    end
  end

  def thank_you_note
    self.thankyounote = "Thanks a lot for donating!" if thankyounote.blank?
  end
  
  def campaign_progress
  #  50
      
    if self.target.to_i > 0
      target = self.target.to_i 
      donated = self.subscriptions.sum(:amount).to_i / 100  #retour vers euro plutot que cents
      progress = donated.to_f / target * 100
    end 
  end

end
