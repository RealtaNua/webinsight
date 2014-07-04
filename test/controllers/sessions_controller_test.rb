require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    chinsiongk = users(:one)
    post :create, name: chinsiongk.name, password: 'Azerty?12'
    
    assert_redirected_to users_url
    assert_equal chinsiongk.id, session[:user_id]
  end

  test "should get fail" do
    chinsiongk = users(:one)
    post :create, name: chinsiongk.name, password: 'wrong'
    
    assert_redirected_to users_url
  end

  test "should get destroy" do
    delete :destroy
    assert_redirected_to(:controller => 'home')
  end

end
