class StepsUserController < ApplicationController

    def fan_account
    end

    def fan_subscribe
        @campaigns = Campaign.all
    end

    def athlete_account
        @sports = Sport.all

    end

    def athlete_campaign
       @is_principale = "true"

    end

    #ajouter first post a athlete en step 4?

end
