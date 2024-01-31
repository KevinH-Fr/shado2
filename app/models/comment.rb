class Comment < ApplicationRecord
  belongs_to :user

  belongs_to :commentable, polymorphic: true, inverse_of: :comments
  has_many :comments, as: :commentable, dependent: :destroy

  MIN_BODY_LENGTH = 2
  MAX_BODY_LENGTH = 1000

  validates :body, presence: true
  validates :body, length: { minimum: MIN_BODY_LENGTH, maximum: MAX_BODY_LENGTH }

  
  # soft delete
  def destroy
    update(deleted_at: Time.zone.now)
  end

  def find_top_parent
    return commentable unless commentable.is_a?(Comment)
    commentable.find_top_parent
  end


end
