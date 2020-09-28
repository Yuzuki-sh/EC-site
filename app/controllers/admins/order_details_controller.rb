class Admins::OrderDetailsController < ApplicationController
    def index 
        @order_details = OrderDetail.all
    end
    def update 
        @order_detail = OrderDetail.find(params[:id])
        if @order_detail.update(order_detail_params)
            redirect_to admin_order_details_path
        else
            render 'edit'
        end
    end
    private
    def order_detail_params
		params.require(:order_detail).permit(:work_status)
    end
end
