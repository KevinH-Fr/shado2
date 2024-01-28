module PostsHelper
    def visible(post)
        return true if athlete_user == post.athlete
        return true unless post.exclusif
        current_user && fan_user && subscribed_fan_to_athlete?(post.athlete, fan_user)
    end

    def upvote_label(post, user)
        if current_user 
            tag.span(post.cached_votes_up)
        end
    end     

end
