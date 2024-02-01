module UserHelper
    def user_info(user)
      athlete = Athlete.find_by(user: user.id)
      fan = Fan.find_by(user: user.id)
    

      if athlete
        { name: athlete.name, path: athlete_path(athlete) }
      elsif fan
        { name: fan.pseudo, path: fan_path(fan) }
      else
        { name: "Unknown User", path: nil }
      end
  end
end
