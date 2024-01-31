class Post < ApplicationRecord
  belongs_to :athlete

  has_one_attached :media, dependent: :destroy

  has_many :comments, -> { order(created_at: :desc) }, as: :commentable, dependent: :destroy, inverse_of: :commentable


  acts_as_votable

  def upvote!(user)
    if user.voted_up_on? self 
      unvote_by user
    else 
      upvote_by user

      if user != self.athlete
        #recipient = self.athlete.user
        #LikePostNotification.with(liker: user, post: self)
        #  .deliver_later(recipient)
      end

    end
  end

  def downvote!(user)
    if user.voted_down_on? self 
      unvote_by user
    else 
      downvote_by user
    end
  end

end
