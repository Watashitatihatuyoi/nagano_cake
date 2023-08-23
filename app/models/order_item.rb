class OrderItem < ApplicationRecord
  
  belongs_to :order
  belongs_to :item
  
  validates :order_id, presence: true
  validates :item_id, presence: true
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  validates :price, presence: true
  validates :making_status, presence: true
  
  enum making_status:{not_ready: 0, pending: 1, making: 2, maked: 3}
  
  
end
