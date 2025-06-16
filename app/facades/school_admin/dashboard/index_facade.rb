class SchoolAdmin::Dashboard::IndexFacade
  attr_reader :current_school_admin, :school

  def initialize(current_school_admin:)
    @current_school_admin = current_school_admin
    @school = current_school_admin.school
  end

  def courses
    @courses ||= @school.courses.includes(course_terms: :registrations)
  end

  def terms
    @terms ||=  @school.terms.includes(:registrations)
  end

  def registration_via_cc_count
    @registration_count ||= Registration.includes(:payment, student: :school).where(student: {school: @school}, payment: {method: Payment::CREDIT_CARD}).uniq(&:student_id).count
  end

  def registration_via_license_count
    @registration_count ||= Registration.includes(:payment, student: :school).where(student: {school: @school}, payment: {method: Payment::LICENSE}).uniq(&:student_id).count
  end
end