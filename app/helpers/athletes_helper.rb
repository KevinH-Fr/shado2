module AthletesHelper
    def athlete_user
        if current_user
            athlete = Athlete.where(user: current_user.id)
            if athlete 
                athlete.first
            end
        end
    end

    def appartenance_athlete(athlete)
        # verifier que le current user detient le compte athlete
        if current_user
            current_user.id == athlete.user.id 
        end
    end
end
 