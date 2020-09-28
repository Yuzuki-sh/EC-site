class EndUsers::ItemsController < ApplicationController
	before_action :authenticate_end_user!, :except => [:top, :index] 
	def top
	end
	def index
		@genres = Genre.all
		if params[:name].present?
			@items = Item.where(['name LIKE ?', "%#{params[:name]}%"]) 
		else
			@items = Item.all
		end
	end
	def show 
		@item = Item.find(params[:id])
		@cart_item = CartItem.new
		@genres = Genre.all
	end
end
