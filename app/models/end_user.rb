class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :last_name, :last_name_kana, :first_name, :first_name_kana,
            :postal_code, :address, :telephone_number, presence: true

  has_many :cart_items
  has_many :orders
  has_many :addresses

  def active_for_authentication?
       super && (self.is_active == true)
  end
end
