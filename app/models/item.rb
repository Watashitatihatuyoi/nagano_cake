class Item < ApplicationRecord

  has_many :cart_items
  has_many :order_items
  belongs_to :genre
  has_one_attached :item_image

  def item_status
    if is_active == true
      "販売中"
    else
      "販売停止中"
    end
  end
  
  validates :item_image, :name, :explanation, :genre_id, :price, presence: true
  validates :is_active, inclusion: { in: [true, false] }

  def with_tax_price
    (price * 1.1).floor
  end

end
