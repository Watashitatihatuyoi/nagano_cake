class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :orders
  has_many :cart_items

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :post_code, presence: true, length: { is: 7 }
  validates :address, presence: true
  validates :phone_number, presence: true, length: {maximum: 11, minimum: 10}



  def own_adress_display
    "〒#{post_code} #{address}"
  end
  
  def full_name
    "#{last_name}#{first_name}"
  end


  def active_for_authentication?
    super && (is_admission == false)
  end




end
