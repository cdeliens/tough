module ActiveModel
  module Validations
    class CapitalsAndLowercaseValidator < EachValidator
      def validate_each(record, attribute, value)
        unless value.match(/[a-z]/).present? && value.match(/[A-Z]/).present?
          record.errors[attribute] << Tough.capitals_lowercase_error_message
        end
      end
    end
    module ClassMethods
      # Validates whether or not the specified URL is valid.
      #
      #   class User < ActiveRecord::Base
      #     validates_url_format_of :site
      #
      #     # Validates against a list of valid TLD.
      #     validates_url_format_of :site, tld: true
      #   end
      #
      def validates_capitals_and_lowercase(*attr_names)
        validates_with CapitalsAndLowercaseValidator, _merge_attributes(attr_names)
      end

      alias_method :validates_capitals_and_lowercase_for, :validates_capitals_and_lowercase
    end
  end
end
