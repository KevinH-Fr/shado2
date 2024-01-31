module UserHelper
    def user_name(user)
        athlete = Athlete.find_by(user: user.id)
        fan = Fan.find_by(user: user.id)
      
        if athlete
          athlete.name
        elsif fan
          fan.pseudo
        else
          # Default name or handle the case when neither athlete nor fan is found
          "Unknown User"
        end
      end
      

    def user_type_path
        #permet de faire le lien vers fan ou athlete path en fonction du type
        #co,struire path sur meme model que name 
    end
end
