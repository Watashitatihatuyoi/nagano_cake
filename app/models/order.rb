class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_items
  
  enum payment_method: {credit_card: 0, transfer: 1}
  enum status: {waiting_for_payment: 0, confirmed_payment: 1, making: 2, shipping_preparation: 3, shipped: 4}
  
  def order_address_display
    "〒#{post_code} #{address}"
  end
  
  def order_price
    self.postage + self.total_price
  end
  
end
