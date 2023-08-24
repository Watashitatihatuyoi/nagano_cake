class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_items
  
  validates :name, presence: true
  validates :post_code, presence: true, length: {maximum: 7, minimum: 7}
  validates :address, presence: true
  validates :customer_id, presence: true
  validates :payment_method, presence: true
  validates :total_price, presence: true
  validates :postage, presence: true
  validates :status, presence: true
  
  
  enum payment_method: {credit_card: 0, transfer: 1}
  enum status: {waiting_for_payment: 0, confirmed_payment: 1, making: 2, shipping_preparation: 3, shipped: 4}
  
  def order_address_display
    "〒#{post_code} #{address}"
  end
  
  def order_price
    self.postage + self.total_price
  end
  
  
  
end
