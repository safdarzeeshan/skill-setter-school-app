class Student::Registrations::NewFacade
  attr_reader :current_student, :params

  def initialize(current_student:, params:)
    @current_student = current_student
    @params = params
  end

  def registration_type
    @registration_type ||= @params[:registration_type] || 'course'
  end

  def active_terms
    @active_terms ||= Term.active.where(school_id: @current_student.school_id)
  end

  def course_terms
    @course_terms ||= CourseTerm.joins(:term).where(terms: { active: true, school_id: current_student.school_id })
  end

  def registration
    @registration ||= begin
      reg = @current_student.registrations.new
      reg.build_payment unless reg.payment
      reg
    end
  end
end