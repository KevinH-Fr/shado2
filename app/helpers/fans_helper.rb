module FansHelper
    def fan_user
        if current_user
            fan = Fan.where(user: current_user.id)
            if fan 
                fan.first
            end
        end
    end

    def appartenance_fan(fan)
      # verifier que le current user detient le compte fan
      if current_user
          current_user.id == fan.user.id 
      end
    end

    def fan_badge(fan)
      span_label = content_tag(:span, fan.pseudo)
      span_image = image_tag(fan.default_profile_pic, class: "mini-profile-pic me-2", alt: "user picture")
    
      combined_content = content_tag(:div, class: "d-flex align-items-center") do
        concat(span_image)
        concat(span_label)
      end 
    end
    
end
