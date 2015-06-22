require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
   include Devise::TestHelpers

   setup do
    @customer = customers(:customer_one)
    @customer_2 = customers(:customer_two)
    @invoice = invoices(:invoice_1)
    @user = users(:user_one)

    sign_in @user
  end

  test "should be success" do
    get :index 
    assert_response :success
  end 

  test "should be show" do
    get :show, id: @customer.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
      post :create, customer: {customer_name: "das"}
    assert_response :redirect
  end

  test "should edit customer" do
    get :edit, id: @customer.id
    assert_response :success, "customer not found"
  end 

  test "should destroy customer" do
    request.env["HTTP_REFERER"] = '/'
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer.id
    end
    assert_redirected_to '/'
  end
  
  test "should update customer" do
    patch :update, id: @customer.id, customer: { customer_name: @customer.customer_name,
                                              customer_address: @customer.customer_address, 
                                              phone_no: @customer.phone_no,
                                              email: @customer.email}
    assert_redirected_to customers_path
  end
end
