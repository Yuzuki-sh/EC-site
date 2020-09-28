class Item < ApplicationRecord
    belongs_to :genre
    has_many :cart_items
    has_many :order_details

	attachment :image
    validates :genre_id, :name, :description, :price, presence: true
    validates :is_active, inclusion: {in: [true, false]}
end
