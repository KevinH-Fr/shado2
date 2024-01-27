class DashboardAthleteController < ApplicationController
  def activities

    @athlete = Athlete.where(user_id: current_user.id).first
    @followers = @athlete.fans.uniq

        
    @subscriptions = @athlete.campaigns.joins(:subscriptions)
    @nbFansByDate = @subscriptions.group('DATE(subscriptions.created_at)').count
    
    @valSubscriptions =  @athlete.campaigns.joins(:subscriptions).sum(:subscription)
    
    @valSubByDate =  @athlete.campaigns.group('DATE(subscriptions.created_at)').joins(:subscriptions).sum(:subscription)
    @nbSubByDate = @subscriptions.group('DATE(subscriptions.created_at)').count

    @posts = @athlete.posts

    @posts_without_media = @posts.select { |post| !post.media.attached? } 
    @posts_with_images = @posts.select { |post| post.media.attached? && post.media.image? }
    @posts_with_videos = @posts.select { |post| post.media.attached? && post.media.video? } 

  end

  def revenues
    @athlete = Athlete.where(user_id: current_user.id).first
        
    @subscriptions = @athlete.campaigns.joins(:subscriptions)
    
    @valSubscriptions = @subscriptions.sum(:subscription)
    
    @valSubByDate = @subscriptions.group('DATE(subscriptions.created_at)').sum(:subscription)
    @nbSubByDate = @subscriptions.group('DATE(subscriptions.created_at)').count

  end

  def monetization
    @athlete = Athlete.where(user_id: current_user.id).first
    @campaigns = @athlete.campaigns

  end

  def guides
  end

  
end
