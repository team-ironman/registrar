require 'test_helper'

class PolicerTest < ActionMailer::TestCase
  test "past_due" do
    mail = Policer.past_due
    assert_equal "Past due", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
