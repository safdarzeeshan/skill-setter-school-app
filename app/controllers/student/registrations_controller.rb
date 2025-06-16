class Student::RegistrationsController < Student::BaseController
  def index
    # @registrations = current_student.registrations.includes(registrationable: {term: {course_terms: :course}, course_term: :course})
    @index_facade = Student::Registrations::IndexFacade.new(current_student: current_student)
  end

  def new
    @registration_facade = Student::Registrations::NewFacade.new(
      current_student: current_student, params: params)
  end

  def create
    registraion_payment_type = params[:registration][:payment_attributes][:method]
    if registraion_payment_type == Payment::CREDIT_CARD
      create_registration_with_cc
    elsif registraion_payment_type == Payment::LICENSE
      create_registration_with_license
    else
      redirect_to new_student_registration_path, alert: 'Invalid payment method selected.'
    end
  end

  def create_registration_with_cc
    @registration = current_student.registrations.new(registration_cc_params)
    if @registration.save
      redirect_to student_registrations_path, notice: 'Registration with credit card created successfully.'
    else
      render :new, alert: 'Failed to create registration'
    end
  end

  def create_registration_with_license
    license_code = params[:registration][:license_code]
    registration_service = Registrations::CreateLicenseRegistrationService.new(
      current_student: current_student,
      license_code: license_code,
      registration_license_params: registration_license_params)
    result = registration_service.call

    if result.success?
      redirect_to student_registrations_path, notice: 'Registration with license created successfully.'
    else
      flash[:alert] = 'Failed to create registration with license. Please check the license code.'
      redirect_to new_student_registration_path(registration_type: 'term')
    end
  end

  private
  def registration_cc_params
    params.require(:registration).permit(:registrationable_type, :registrationable_id, :registered_at, :active, payment_attributes: [:method, :cc_number])
  end

  def registration_license_params
    params.require(:registration).permit(:registrationable_type, :registrationable_id, :registered_at, :active, payment_attributes: [:method])
  end
end
