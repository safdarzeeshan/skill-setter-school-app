class ResultService
  # This class is used to encapsulate the result of an operation, including success status, data, and errors.
  # It provides a consistent way to handle the outcome of operations in the application.
  attr_reader :success, :data, :errors

  def initialize(success:, data: nil, errors: [])
    @success = success
    @data = data
    @errors = errors
  end

  def success?
    @success
  end
end
