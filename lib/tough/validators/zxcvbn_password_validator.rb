module ActiveModel
  module Validations
    class ZxcvbnPasswordValidator < EachValidator
      def validate_each(record, attribute, value)
        #0 too guessable: risky password. (guesses < 10^3)
        #1 very guessable: protection from throttled online attacks. (guesses < 10^6)
        #2 somewhat guessable: protection from unthrottled online attacks. (guesses < 10^8)
        #3 safely unguessable: moderate protection from offline slow-hash scenario. (guesses < 10^10)
        #4 very unguessable: strong protection from offline slow-hash scenario. (guesses >= 10^10)
        unless Zxcvbn.test(value).score >= Tough.zxcvbn_minimum_score_to_pass
          record.errors[attribute] << Tough.zxcvbn_error_message 
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
      def validates_by_zxcvbn_metric(*attr_names)
        validates_with ZxcvbnPasswordValidator, _merge_attributes(attr_names)
      end

      alias_method :validates_with_zxcvbn, :validates_by_zxcvbn_metric
    end
  end
end
