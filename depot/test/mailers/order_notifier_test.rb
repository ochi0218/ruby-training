require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))

    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["ochi0218@gmail.com"], mail.to
    assert_equal ["from@example.com"], mail.from
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))

    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["ochi0218@gmail.com"], mail.to
    assert_equal ["from@example.com"], mail.from
  end

end
