class Registrations::CreateLicenseRegistrationService
  attr_reader :student, :license_code, :registration_params, :term_id

  def initialize(student = nil, license_code = nil, registration_params = {})
    @student = student
    @license_code = license_code
    @registration_params = registration_params
    @term_id = registration_params[:registrationable_id]
  end

  def call
    license = License.find_by(code: license_code, redeemed_by_student_id: nil, term_id: @term_id)
    return ResultService.new(success: false) unless license

    registration_params[:payment_attributes][:license_id] = license.id

    ActiveRecord::Base.transaction do
      registration = @student.registrations.new(registration_params)
      registration.save!
      license.update!(
        redeemed_by_student: @student,
        redeemed_at: Time.current
      )
      ResultService.new(success: true, data: registration)
    end
  rescue ActiveRecord::RecordInvalid
    ResultService.new(success: false)
  end
end
