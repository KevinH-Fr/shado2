class Post < ApplicationRecord
  belongs_to :athlete

  has_one_attached :media, dependent: :destroy

  has_many :comments, -> { order(created_at: :desc) }, as: :commentable, dependent: :destroy, inverse_of: :commentable


  after_create_commit :notify_recipient 
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  has_many :notifications, dependent: :destroy



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


  private 
  
  def notify_recipient

    recipient = User.last
    #puts "----------------- recipients: #{recipient.ids} -------------------------"

    PostNotification.with(post: self)
      .deliver_later(recipient)
  end

  def cleanup_notifications 
    notifications_as_comment.destroy_all
  end



end
