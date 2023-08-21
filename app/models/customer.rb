class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :orders
  has_many :cart_items


  def own_adress_display
    '〒'+self.postal_code+''+self.address
  end


  def active_for_authentication?
    super && (is_admission == false)
  end




end
