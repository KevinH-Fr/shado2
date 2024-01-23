class Campaign < ApplicationRecord
  belongs_to :athlete

  has_many :subscriptions
  has_many :fans, through: :subscriptions

  
end
