module ActiveModel
  module Validations
    class MinimumCharactersValidator < EachValidator
      def validate_each(record, attribute, value)
        unless value.length >= Tough.minimum_characters
          record.errors[attribute] << Tough.minimum_characters_error_message
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
      def validates_minimum_characters(*attr_names)
        validates_with MinimumCharactersValidator, _merge_attributes(attr_names)
      end

      alias_method :validates_minimum_characters_for, :validates_minimum_characters
    end
  end
end
