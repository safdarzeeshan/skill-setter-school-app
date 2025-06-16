# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

ActiveRecord::Base.transaction do
  # Schools
  school = School.create!(name: "School")

  # School Admins
  user = User.create!(email: 'school_admin@email.com', password: 'Test123')
  school_admin = SchoolAdmin.create!(school: school, name: "John Smith", user: user)

  # Students
  student_user = User.create!(email: 'student@email.com', password: 'Test123')
  student = Student.create!(school: school, name: "Jane Smith", user: student_user)

  # Terms
  terms = 10.times.map do |i|
    Term.create!(
      school: school,
      name: "Term #{school.id}-#{i}",
      start_date: Date.today + rand(1..100),
      end_date: Date.today + rand(101..200)
    )
  end

  # Courses
  courses = 10.times.map do |i|
    Course.create!(
      school: school,
      name: "Course #{school.id}-#{i}",
      description: "Description for Course #{school.id}-#{i}"
    )
  end

  # CourseTerms
  course_terms = courses.map do |c|
    CourseTerm.create!(
      course: c,
      term: terms.first
    )
  end

  # Registration and payment
  payment = Payment.create!(method: Payment::CREDIT_CARD, cc_number: 123456)
  registration = Registration.create!(student: student, registered_at: Time.now, registrationable: course_terms.sample, payment: payment)
end


