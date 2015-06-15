class Lineitem < ActiveRecord::Base
  belongs_to :invoice, touch: true

  validates :quantity, :presence => true, :numericality => { :integer => true }
  validates :unit_price, :presence => true, :numericality => true

  # attr_accessible :quantity, :unit_price
  before_save :calculate_amount
  
  def calculate_amount
    self.amount = quantity * unit_price
  end
end
