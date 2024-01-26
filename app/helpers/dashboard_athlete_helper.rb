module DashboardAthleteHelper
    def dashboard_athlete_link(name, path, target_action)
      link_to name, path, class: "btn btn-primary m-1 fs-4 #{'selected-dashboard-athlete-navbar' if controller_name == 'dashboard_athlete' && action_name == target_action}"
    end
  end
  