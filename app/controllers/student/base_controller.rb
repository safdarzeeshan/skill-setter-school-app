class Student::BaseController < ApplicationController
  layout 'student'
  before_action :authenticate_user!
  before_action :authenticate_student!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to student_registrations_path, alert: exception.message
  end

  def authenticate_student!
    unless current_user&.student
      redirect_to root_path, alert: 'You must be a student to access this section.'
    end
  end

  def current_student
    current_user.student
  end
end