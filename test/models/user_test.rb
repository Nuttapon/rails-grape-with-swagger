require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "that user creates a user" do
    user = User.new(name: "Memo", email: "memo@example.com")

    assert user.valid?
    assert user.save

    user.reload

    assert_equal "Memo", user.name
    assert_equal "memo@example.com", user.email
  end
end
