require 'test_helper'

class LineitemTest < ActiveSupport::TestCase
  test "calculate_amount" do 
    lineItem = lineitems(:lineitem_one)
    assert_equal(100, lineItem.calculate_amount)
  end
end

