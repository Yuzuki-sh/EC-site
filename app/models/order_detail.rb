class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item
    enum work_status: { preparing_production: 0, production: 1, produced: 2 }

    attr_accessor :item_ids_list
end
