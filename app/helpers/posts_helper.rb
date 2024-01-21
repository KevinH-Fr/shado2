module PostsHelper
    def visible(post)
        return true if athlete_user == post.athlete
        return true unless post.exclusif
        current_user && fan_user && subscribed_fan?(post.athlete, fan_user)
    end
end
  