class Address < ApplicationRecord
  
  belongs_to :customer
  
  validates :name, presence: true
  validates :post_code, presence: true, length: {maximum: 7, minimum: 7}
  validates :address, presence: true
  
  def address_display
    '〒' + post_code + ' ' + address + ' ' + name
  end
  
end
