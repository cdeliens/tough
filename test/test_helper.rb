require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require "bundler/setup"
require "active_record"
require "active_support/all"

require "minitest/utils"
require "minitest/autorun"
require "tough"

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f}

ActiveRecord::Base.establish_connection :adapter => "sqlite3", :database => ":memory:"
load "schema.rb"


module Minitest
  class Test
    setup do

      ActiveRecord::Base.descendants.each do |model|
        next if model.name == "ActiveRecord::SchemaMigration"

        model.delete_all

        # Object.class_eval {
        #   remove_const model.name if const_defined?(model.name)
        # }
      end

      load File.dirname(__FILE__) + "/support/models.rb"
    end
  end
end
