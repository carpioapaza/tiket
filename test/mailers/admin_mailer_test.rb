require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase
  test "new_event_notification" do
    mail = AdminMailer.new_event_notification
    assert_equal "New event notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
