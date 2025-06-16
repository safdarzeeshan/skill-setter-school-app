class SchoolAdmin::DashboardController < SchoolAdmin::BaseController

  def index
    @index_facade = SchoolAdmin::Dashboard::IndexFacade.new(current_school_admin: current_school_admin)
  end
end
