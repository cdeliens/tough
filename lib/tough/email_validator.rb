class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << 'is not an email' unless /^[A-Z0-9_\.%\+\-]+@(?:[A-Z0-9\-]+\.)+(?:[A-Z]{2,4}|museum|travel)$/i.match(value)
  end
end