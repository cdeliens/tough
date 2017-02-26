class User < ActiveRecord::Base
  validates_by_zxcvbn_metric :password
end
