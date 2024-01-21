module AthletesHelper
    def athlete_user
        if current_user
            athlete = Athlete.where(user: current_user.id)
            if athlete 
                athlete.first
            end
        end
    end
end
