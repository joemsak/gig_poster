class ComplexPasswordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? and !value.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%&\*]).{8,}$/)
      record.errors.add attribute, "must include at least one lowercase letter, one uppercase letter, one digit, one symbol (!, @, #, $, %, &, *), and needs to be minimum 8 characters."
    end
  end
end
