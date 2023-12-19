require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should be valid with all required attributes" do
    user = User.new(
      first_name: "John",
      last_name: "Doe",
      username: "johndoe")
  assert user.valid?, "User should be valid"
  end

  test "should not be valid without first_name" do
    user = User.new(
      last_name: "Doe",
      username: "johndoe")

    assert_not user.valid?, "User can't be valid without first_name"
  end

  test "should not be valid without last_name" do
    user = User.new(
      first_name: "John",
      username: "johndoe"
    )

    assert_not user.valid?, "User can't be valid without last_name"
  end

  test "should not be valid without username" do
    user = User.new(
      first_name: "John",
      last_name: "Doe"
    )

    assert_not user.valid?, "User can't be valid without username"
end
