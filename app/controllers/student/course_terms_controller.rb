class Student::CourseTermsController < Student::BaseController
  def show
    @course_term = CourseTerm.find(params[:id])
    authorize! :read, @course_term
  end
end