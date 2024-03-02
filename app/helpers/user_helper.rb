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

  def user_badge(user)

    if athlete = Athlete.find_by(user_id: user.id)
      name = athlete.name
      profilepic = athlete.default_profile_pic
      role = "athlete"
    elsif fan = Fan.find_by(user_id: user.id)
      name = fan.pseudo
      profilepic = fan.default_profile_pic
      role = "fan"
    else
      name = "not defined"
      profilepic = "profile_default.png"
      role = "not defined"
    end

    content_tag(:div, class: 'card mb-2 d-flex flex-row justify-content-between align-items-center p-2') do
      concat image_tag(profilepic, class: 'mini-profile-pic me-2', alt: 'user picture')
          concat content_tag(:h5, name, class: '')
          concat content_tag(:span, "Email: #{user.email}", class: 'mx-1')
          concat content_tag(:span, "Role: #{role}", class: '')
      concat link_to('Start chat', user_path(user), class: 'btn btn-primary ms-auto')
    end
    

  end

end
