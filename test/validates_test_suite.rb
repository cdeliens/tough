require "test_helper"

class ValidatesTestSuite < Minitest::Test

  test "requires valid password with capitals and lowercase" do
    record = User.new(password: "invalid", password_confirmation: "invalid")
    record.valid?

    refute record.errors[:password].empty?
  end

  test "sets error message for capitals and lowercase validation" do
    record = User.new(password: "invalid", password_confirmation: "invalid")
    record.valid?

    assert_includes record.errors[:password], Tough.capitals_lowercase_error_message
  end

  test "requires valid password with minimum amount of characters" do
    Tough.minimum_characters = 10
    record = User.new(password: "invalid", password_confirmation: "invalid")
    record.valid?

    refute record.errors[:password].empty?
  end

  test "sets error message for minimum amount of characters validation" do
    Tough.minimum_characters = 10
    record = User.new(password: "invalid", password_confirmation: "invalid")
    record.valid?

    assert_includes record.errors[:password], Tough.minimum_characters_error_message
  end

  # ZXCVBN validation tests
  test "requires valid password with special characters" do
    record = User.new(password: "invalid", password_confirmation: "invalid")
    record.valid?

    refute record.errors[:password].empty?
  end

  test "sets error message for special characters validation" do
    record = User.new(password: "invalid", password_confirmation: "invalid")
    record.valid?

    assert_includes record.errors[:password], Tough.special_characters_error_message
  end

  # ZXCVBN validation tests
  test "requires valid password by ZXCVBN lib metrics" do
    record = User.new(password: "invalid", password_confirmation: "invalid")
    record.valid?

    refute record.errors[:password].empty?
  end

  test "sets error message" do
    record = User.new(password: "invalid", password_confirmation: "invalid")
    record.valid?

    assert_includes record.errors[:password], Tough.zxcvbn_error_message
  end
end
