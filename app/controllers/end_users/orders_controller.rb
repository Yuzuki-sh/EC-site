class EndUsers::OrdersController < ApplicationController
	before_action :cart_item_exist?, except: [:index, :show, :complete]
	before_action :authenticate_end_user!
	def index
		@orders = current_end_user.orders
		binding.pry
	end
	def complete
	end
	def show
		@order = Order.find(params[:id])
		@order_detail = OrderDetail.new
	end
	def new
		@order = Order.new
	end
	def create
		orderer = EndUser.find(params[:order][:end_user_id])
		#ご自身の住所から登録	0
		#登録済み住所から登録	1
		#新規住所から登録　　	2
		case params[:order][:address_option].to_i
			when 0 then
				order = Order.new(
					end_user_id:	orderer.id,
					postcode:		orderer.postal_code,
					address:		orderer.address,
					delivery_name:	orderer.last_name + orderer.first_name,
					payment: 		params[:order][:payment]
				)
				order.total_fee = calc_TotalFee(orderer.cart_items)
				order.postage = 800
				if order.save
					redirect_to end_users_order_path(order) and return
				end
			when 1 then
				orderer_address = Address.find(params[:order][:address_id])
				order = Order.new(
					end_user_id: 	orderer.id,
					postcode: 	 	orderer_address.postal_code,
					address: 	 	orderer_address.address,
					delivery_name: 	orderer_address.name,
					payment: 		params[:order][:payment]
					)
				order.total_fee = calc_TotalFee(orderer.cart_items)
				order.postage = 800
				if order.save
					redirect_to end_users_order_path(order) and return
				end
			when 2 then
				address = Address.new(
					end_user_id: 	orderer.id,
					postal_code: 	params[:order][:postcode],
					address: 		params[:order][:address],
					name: 			params[:order][:delivery_name]
					)
				order = Order.new(order_params)
				order.total_fee = calc_TotalFee(orderer.cart_items)
				order.postage = 800
				if address.save and order.save
					redirect_to end_users_order_path(order) and return
				end
			else
		end
		redirect_to items_path
	end
	def confirm
		item_ids = params[:order_detail][:item_ids_list].split(' ').map{|str| str.to_i}
		item_ids.each do |item_id|
			cart_item = CartItem.find_by(
				end_user_id: current_end_user.id,
				item_id:	 item_id
			)
			item = Item.find(item_id)
			order_detail = OrderDetail.new(
				order_id: params[:order_detail][:order_id],
				item_id:  item_id,
				price_include_tax: (item.price*1.1).to_i,
				amount:   cart_item.amount
			)
			if order_detail.save
				cart_item.destroy
			else
				redirect_to root_path and return
			end
		end
		redirect_to end_users_orders_complete_path
	end

	private
	def cart_item_exist?
		if current_end_user.cart_items.empty?
			redirect_to end_users_cart_items_path, notice: 'カートが空です'
		end
	end
	def order_params
        params.require(:order).permit(:end_user_id, :postcode, :address, :delivery_name, :payment)
	end
	def calc_TotalFee(cart_items)
		sum = 0
		cart_items.each do |cart_item|
			sum += Item.find(cart_item.item_id).price*cart_item.amount
		end
		return sum
	end
	def delete_CartItems(cart_items)
		cart_items.destroy_all
	end
end
