class SpecialCharactersValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.match(/\W/).present?
      record.errors[attribute] << "must contain special characters"
    end
  end
end
