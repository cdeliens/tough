class MinimumCharactersValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    minimum_characters = 8
    unless value.length >= minimum_characters
      record.errors[attribute] << "must be a minimum of #{minimum_characters} characters long"
    end
  end
end
