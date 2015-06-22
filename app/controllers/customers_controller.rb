class CustomersController < ApplicationController
   before_action :authenticate_user!

  def index
    @customers = current_user.customers
  end
  
  def show
    # @customer = current_user.customers.where(id: params[:id])
    # @customer = Customer.find params[:id]
    @customer = current_user.customers.where(id: params[:id]).first 
    @invoices = @customer.invoices.where(id: params[:id]).first
  end
  
  def new
    @customer = current_user.customers.new 
  
  end
  
  def create
    @customer = current_user.customers.new(customer_params)
    if @customer.save
      redirect_to customer_path(@customer)
    else
      render :new
    end
  end

  def update
    @customer = current_user.customers.where(id: params[:id]).first
    # @customer = Customer.find params[:id]
    if @customer.update_attributes(customer_params)
      redirect_to customers_path
    end
  end
  
  def destroy
   @customer = current_user.customers.where(id: params[:id]).first
    # @customer = Customer.find params[:id]
    @customer.destroy

    redirect_to :back
  end
  
  def edit
    @customer = current_user.customers.where(id: params[:id]).first
    # @customer = Customer.find params[:id]
  end

  private

  def customer_params
    params.require(:customer).permit(:user_id, :customer_name, :customer_address, :phone_no, :email, :first_name, :last_name, :phone, :address)
  end
end
