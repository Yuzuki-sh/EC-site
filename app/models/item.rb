class Item < ApplicationRecord
	belongs_to :genre
	attachment :image
    validates :genre_id, :name, :description, :price, presence: true
    validates :is_active, inclusion: {in: [true, false]}
end
