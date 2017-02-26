$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "bundler/setup"
require "active_record"
require "tough"

ActiveRecord::Base.establish_connection :adapter => "sqlite3", :database => ":memory:"
load "schema.rb"

RSpec.configure do |config|
  config.around do |example|
    ActiveRecord::Base.transaction do
      example.run
      raise ActiveRecord::Rollback
    end
  end
end
load File.dirname(__FILE__) + "/support/models.rb"
module Rspec
  class Test
    setup do
      I18n.locale = :en
      Time.zone = "America/Sao_Paulo"

      ActiveRecord::Base.descendants.each do |model|
        next if model.name == "ActiveRecord::SchemaMigration"

        model.delete_all

        Object.class_eval {
          remove_const model.name if const_defined?(model.name)
        }
      end

      load File.dirname(__FILE__) + "/support/models.rb"
    end
  end
end
