module ActiveModel
  module Validations
    class SpecialCharactersValidator < EachValidator
      def validate_each(record, attribute, value)
        unless value.match(/\W/).present?
          record.errors[attribute] << Tough.special_characters_error_message
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
      def validates_special_characters(*attr_names)
        validates_with SpecialCharactersValidator, _merge_attributes(attr_names)
      end

      alias_method :validates_special_characters_for, :validates_special_characters
    end
  end
end
