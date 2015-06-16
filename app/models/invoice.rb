class Invoice < ActiveRecord::Base
  has_many :lineitems, :dependent => :destroy

  accepts_nested_attributes_for :lineitems, :allow_destroy => true
  
  validates :invoice_no,
            presence: true,
            uniqueness: true
  
  after_touch :calculate_total
  after_initialize :generate_id
  
  def generate_id
    unless invoice_no
      last_invoice = Invoice.order(:invoice_no).last
      self.invoice_no = last_invoice ? last_invoice.invoice_no.succ : "IN001"
    end
  end

  def calculate_total
    self.total = lineitems.sum(:amount)
    self.save
  end

end
