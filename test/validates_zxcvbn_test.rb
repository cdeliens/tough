require "test_helper"

class ValidatesCnpjFormatOfTest < Minitest::Test

  test "requires valid password by ZXCVBN lib metrics" do
    record = User.new(password: "invalid", password_confirmation: "invalid")
    record.valid?

    refute record.errors[:password].empty?
  end

  test "sets error message" do
    record = User.new
    record.valid?

    assert_includes record.errors[:password], "is too easy to guess"
  end
end
