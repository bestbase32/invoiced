require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
 
   setup do
    @invoice = invoices(:invoice_1)
    @invoice_2 = invoices(:invoice_2)
    @customer = customers(:customer_one)
    @customer_2 = customers(:customer_two)
    @user = users(:user_one)

    sign_in @user 
  end

  test "should be success" do
    sign_in @user
    get :index, customer_id: @customer.id
    assert_response :success
  end 

  test "should be show" do 
    get :show, customer_id: @customer.id, id: @invoice.id
    assert_response :success
  end

  test "should get new" do
    get :new, customer_id: @customer.id
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count', +1) do
      post :create, customer_id: @customer.id, invoice: { invoice_no: "IN003" }
    end
    assert_response :redirect
  end

  test "should edit invoice" do
    get :edit, customer_id: @customer.id, id: @invoice.id
    assert_response :success, "invoice not found"
  end 

  test "should destroy invoice" do
    request.env["HTTP_REFERER"] = '/'
    assert_difference('Invoice.count', -1) do
    delete :destroy, customer_id: @customer.id,id: @invoice.id
    end
    assert_redirected_to '/'
  end
  
  test "should update invoice" do
    patch :update, customer_id: @customer.id,id: @invoice.id, invoice: { invoice_no: @invoice.invoice_no,
                                              due_date: @invoice.due_date,
                                              issue_date: @invoice.issue_date, 
                                              total: @invoice.total}
    assert_redirected_to customer_path(@customer)
  end
end
  