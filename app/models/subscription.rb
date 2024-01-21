class Subscription < ApplicationRecord
  belongs_to :campaign
  belongs_to :fan
end
