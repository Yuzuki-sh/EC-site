class CartItem < ApplicationRecord
    belongs_to :item
    belongs_to :end_user
    validates :end_user_id, :item_id, :amount, presence: true
end
