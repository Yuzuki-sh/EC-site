class EndUsers::CartItemsController < ApplicationController
    before_action :authenticate_end_user!
    def index 
        @cart_items = CartItem.all
    end
    def create 
        cart_item = CartItem.new(cart_item_params)
        duplication_cart_item = CartItem.find_by(end_user_id: cart_item.end_user_id,item_id: cart_item.item_id)
        if duplication_cart_item.nil?
            if cart_item.save
                redirect_to end_users_cart_items_path #カートの一覧画面
            else
                render 'end_users/items/show'
            end
        else
            duplication_cart_item.amount += cart_item.amount
            if duplication_cart_item.save
                redirect_to end_users_cart_items_path #カートの一覧画面
            else
                render 'end_users/items/show'
            end
        end
    end
    def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_to end_users_cart_items_path
    end
    def update 
        # cart_item = CartItem.find(params[:id])
        cart_item = CartItem.find_by(end_user_id: params[:cart_item][:end_user_id],item_id: params[:cart_item][:item_id])
        # binding.pry
        if cart_item.update(cart_item_params)
            redirect_to end_users_cart_items_path
        end
    end
    def destroy_all
        CartItem.destroy_all
        redirect_to end_users_cart_items_path
    end
    private
    def cart_item_params
        params.require(:cart_item).permit(:end_user_id, :item_id, :amount)
    end
end

