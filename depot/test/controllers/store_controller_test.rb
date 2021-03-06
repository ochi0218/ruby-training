require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  fixtures :products

  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', minimun: 4
    assert_select '#main .entry', 3
    assert_select 'h3', 'Ruby'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end
  
  test "markup needed for store.js.coffe is in place" do
    get :index
    assert_select '.store .entry > img', 3
    assert_select '.entry input[type=submit]', 3
  end
end
