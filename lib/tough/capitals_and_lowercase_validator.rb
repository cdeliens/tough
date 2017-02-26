class CapitalsAndLowercaseValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.match(/[a-z]/).present? && value.match(/[A-Z]/).present?
      record.errors[attribute] << "must have lowercase and uppercase letters"
    end
  end
end
