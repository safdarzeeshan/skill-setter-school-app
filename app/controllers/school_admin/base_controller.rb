class SchoolAdmin::BaseController < ApplicationController
  layout 'school_admin'
  before_action :authenticate_user!
  before_action :authenticate_school_admin!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to admin_dashboard_path, alert: exception.message
  end

  def authenticate_school_admin!
    unless current_user&.school_admin
      redirect_to root_path, alert: 'You must be a school admin to access this section.'
    end
  end

  def current_school_admin
    current_user.school_admin
  end
end