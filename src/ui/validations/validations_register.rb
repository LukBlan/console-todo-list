require_relative './list_already_exist_validation'

class ValidationsRegister
  def initialize
    @validations = [
      List_Already_Exist_Validation.new,
    ]
  end

  def validations
    validation_hash = Hash.new
    @validations.each { |validation| validation_hash[validation.name] = validation }
    validation_hash
  end
end
