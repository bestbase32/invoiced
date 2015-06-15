class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end
  
  def show
    @invoice = Invoice.find params[:id]
  end
  
  def new
    @invoice = Invoice.new 

  end
  
  def create
    if @invoice = Invoice.create(invoice_params)
      redirect_to invoice_path(@invoice.id)
    else
      render :new
    end
  end

   def update
    @invoice = Invoice.find params[:id]
    if @invoice.update_attributes(invoice_params)
    redirect_to invoices_path()
    end
  end
  
  def destroy
    @invoice = Invoice.find params[:id]
    @invoice.destroy
    redirect_to :back
  end
  
  def edit
    @invoice = Invoice.find params[:id]
  end
  
 

  def invoice_params
    params.require(:invoice).permit(:invoice_no, :total, :issue_date, :due_date, 
                                    lineitems_attributes: [:invoice_id, :id, :product_id, :product_name, :quantity, :unit_price, :amount, :_destroy])
  end

end

