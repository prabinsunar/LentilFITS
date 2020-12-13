require 'test_helper'

class TransferMailerTest < ActionMailer::TestCase
  test "create_transfer" do
    mail = TransferMailer.create_transfer
    assert_equal "Create transfer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
