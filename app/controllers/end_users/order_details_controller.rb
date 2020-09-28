class EndUsers::OrderDetailsController < ApplicationController
    before_action :authenticate_end_user!
    def index
        orders = current_end_user.orders 
        @order_details_2d = []
        orders.each do |order|
            @order_details_2d.push(order.order_details)
        end
    end
end
