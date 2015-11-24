require 'test_helper'

class ConfirmationTest < ActionMailer::TestCase
  test "new_confirm" do
    mail = Confirmation.new_confirm
    assert_equal "New confirm", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
