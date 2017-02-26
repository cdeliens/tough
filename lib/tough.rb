require "tough/version"
require 'helpers/configuration'


module Tough
  extend Configuration

  require "zxcvbn"
  require "tough/validators/capitals_and_lowercase_validator"
  require "tough/validators/minimum_characters_validator"
  require "tough/validators/special_characters_validator"
  require "tough/validators/zxcvbn_password_validator"

  define_setting :zxcvbn_minimum_score_to_pass, 3
  define_setting :zxcvbn_error_message, "is too easy to guess"
  define_setting :special_characters_error_message, "must contain special characters"
  define_setting :minimum_characters, 8
  define_setting :minimum_characters_error_message, "must be a minimum of #{Tough.minimum_characters} characters long"
  define_setting :capitals_lowercase_error_message, "must have lowercase and uppercase letters"
end

# config/initializers/tough.rb
# Tough.configuration do |config|
#  config.zxcvbn_minimum_score_to_pass = 3
#  config.zxcvbn_error_message = "is too easy to guess"
#  config.special_characters_error_message = "must contain special characters"
#  config.minimum_characters = 8
#  config.minimum_characters_error_message = "must be a minimum of #{Tough.minimum_characters} characters long"
#  config.capitals_lowercase_error_message = "must have lowercase and uppercase letters"
# end
