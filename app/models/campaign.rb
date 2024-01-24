class Campaign < ApplicationRecord
  belongs_to :athlete

  has_many :subscriptions
  has_many :fans, through: :subscriptions

  def thank_you_note
    self.thankyounote = "Thanks a lot for donating!" if thankyounote.blank?
  end
  
end
