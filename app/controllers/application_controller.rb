class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  
  def after_sign_in_path_for(resource)
    if resource.student
      student_registrations_path
    elsif resource.school_admin
      school_admin_dashboard_index_path
    end
  end
end
