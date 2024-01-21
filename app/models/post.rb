class Post < ApplicationRecord
  belongs_to :athlete

  has_one_attached :media, dependent: :destroy

end
