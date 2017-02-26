class PasswordReuseValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.password_history.each do |password|
      if User.crypto_provider.matches?(password[:crypted], value + password[:salt])
        return record.errors[attribute] << "password has been used before, please try a new one"
      end
    end
  end
end
