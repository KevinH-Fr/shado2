module LandingPageHelper
    def reanimated_svg_with_content(svg_path, h3_text, h4_text)
        content_tag(:div, class: "container text-center my-3", data: { controller: "reanimate-svg" }) do
          concat image_tag("#{svg_path}?#{Time.now.to_i}", width: 250, height: 250, alt: "Animated GIF", class: "reanimate-svg")
        end +
        content_tag(:h3, h3_text, class: "fw-bold text-center") +
        content_tag(:h4, h4_text, class: "text-center")
    end
end
