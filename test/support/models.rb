class User < ActiveRecord::Base
  validates_by_zxcvbn_metric :password
  validates_capitals_and_lowercase_for :password
  validates_minimum_characters_for :password
  validates_special_characters_for :password
end
