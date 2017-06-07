require 'test_helper'

class PortfolioItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get portfolio_items_new_url
    assert_response :success
  end

end
