class InvoicesController < ApplicationController
  before_action :authenticate_user!
  def index
    @customer = current_user.customers.where(id: params[:customer_id]).first
    @invoices = if @customer.present?
    @customer.invoices
    else
      current_user.invoices
    end 
  end
  
  def show
    @customer = current_user.customers.where(id: params[:customer_id]).first
    @invoice = @customer.invoices.where(id: params[:id]).first
  end
  
  def new
    @customer = current_user.customers.where(id: params[:customer_id]).first
    @invoice = @customer.invoices.build
    # @invoice = Invoice.new 
  end
  
  def create
  @customer = current_user.customers.where(id: params[:customer_id]).first
  @invoice = @customer.invoices.build(invoice_params)
    if @invoice.save
      redirect_to customer_path(@customer)
    else
      render :new
    end
  end

   def update
    @customer = current_user.customers.where(id: params[:customer_id]).first
    @invoice = @customer.invoices.where(id: params[:id]).first
    if @invoice.update_attributes(invoice_params)

      redirect_to customer_path(@customer)
    end
  end
  
  def destroy
    @customer = current_user.customers.where(id: params[:customer_id]).first
    @invoice = @customer.invoices.where(id: params[:id]).first
    @invoice.destroy

    redirect_to :back
  end
  
  def edit
    @customer = current_user.customers.where(id: params[:customer_id]).first
    @invoice = @customer.invoices.where(id: params[:id]).first
  end
  
 

  def invoice_params
    params.require(:invoice).permit(:invoice_no, :total, :issue_date, :due_date, :customer_id, :pay_remain, :pay_total,
                                    lineitems_attributes: [:invoice_id, :id, :product_id, :product_name, :quantity, :unit_price, :amount, :_destroy],
                                    payments_attributes: [:invoice_id, :id, :pay_date, :pay_desc, :pay_method, :pay_amount, :_destroy])
  end
 
end


