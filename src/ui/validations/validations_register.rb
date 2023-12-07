require_relative './list_already_exist_validation'
require_relative './list_dont_exist_validation'
require_relative './item_already_exist_validation'
require_relative './deadline_format_validation'

class ValidationsRegister
  def initialize
    @validations = [
      ListAlreadyExistValidation.new,
      ListDontExistValidation.new,
      ItemAlreadyExistValidation.new,
      DeadlineFormatValidation.new
    ]
  end

  def validations
    validation_hash = Hash.new
    @validations.each { |validation| validation_hash[validation.name] = validation }
    validation_hash
  end
end
