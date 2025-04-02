class ComplexPasswordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? and !value.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%&\*]).{8,}$/)
      record.errors.add attribute, "must contain at least 1 lowercase letter, 1 uppercase letter, 1 number, 1 symbol (!, @, #, $, %, &, *), and needs to be a minimum of 8 characters."
    end
  end
end
