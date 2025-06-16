class Student::Registrations::IndexFacade
  attr_reader :current_student

  def initialize(current_student:)
    @current_student = current_student
  end

  def course_term_registrations
    @course_term_registrations ||= @current_student.registrations.course_terms.includes(
      registrationable: [:course, :term])
  end

  def term_registrations
    @term_registrations ||= @current_student.registrations.terms.includes(
      registrationable: :courses)
  end
end