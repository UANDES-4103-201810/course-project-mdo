require 'test_helper'

class PromisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @promise = promises(:one)
  end

  test "should get index" do
    get promises_url
    assert_response :success
  end

  test "should get new" do
    get new_promise_url
    assert_response :success
  end

  test "should create promise" do
    assert_difference('Promise.count') do
      post promises_url, params: { promise: { description: @promise.description, price: @promise.price, quantity: @promise.quantity, release_date: @promise.release_date } }
    end

    assert_redirected_to promise_url(Promise.last)
  end

  test "should show promise" do
    get promise_url(@promise)
    assert_response :success
  end

  test "should get edit" do
    get edit_promise_url(@promise)
    assert_response :success
  end

  test "should update promise" do
    patch promise_url(@promise), params: { promise: { description: @promise.description, price: @promise.price, quantity: @promise.quantity, release_date: @promise.release_date } }
    assert_redirected_to promise_url(@promise)
  end

  test "should destroy promise" do
    assert_difference('Promise.count', -1) do
      delete promise_url(@promise)
    end

    assert_redirected_to promises_url
  end
end
