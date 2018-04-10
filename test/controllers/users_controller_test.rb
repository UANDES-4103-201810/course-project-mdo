require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { address: @user.address, admin: @user.admin, birth_date: @user.birth_date, email: @user.email, image: @user.image, last_login: @user.last_login, last_name: @user.last_name, name: @user.name, password: @user.password, security_answer: @user.security_answer, security_question: @user.security_question } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { address: @user.address, admin: @user.admin, birth_date: @user.birth_date, email: @user.email, image: @user.image, last_login: @user.last_login, last_name: @user.last_name, name: @user.name, password: @user.password, security_answer: @user.security_answer, security_question: @user.security_question } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
