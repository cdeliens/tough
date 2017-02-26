require "spec_helper"

describe Tough do

  let(:model) { Class.new {
    def self.name
      "User"
    end

    include ActiveModel::Model
    validates :password, zxcvbn_password: true
  } }


  it "has a version number" do
    expect(Tough::VERSION).not_to be nil
  end

  it "validates password with zxcvbn security level" do
    record = model.new(password: "invalid", password_confirmation: "invalid")
    expect(record.valid?).to eq(false)
  end
end
