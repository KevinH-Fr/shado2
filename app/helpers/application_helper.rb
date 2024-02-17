module ApplicationHelper
    def active_link_colored(link_path, text, icon, controller, action)
          
        css_classes = (controller_name == controller && (action.nil? || action_name == action)) ? ' orange-colored' : 'text-secondary'
  
        link_to(content_tag(:div, class: "btn btn-link #{css_classes}") do
          concat content_tag(:i, "", class: "fa fa-#{icon}")
          concat content_tag(:div, text, class: "")
        end, link_path)

    end
end
