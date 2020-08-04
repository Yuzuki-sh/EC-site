class Admins::ItemsController < ApplicationController
	def index
		@items = Item.all
	end
	def new
		@item = Item.new
	end
	def create
		@item = Item.new(item_params)
        if @item.save
            redirect_to admins_item_path(@item)
        else
			render 'new'
		end
	end
	def show
		@item = Item.find(params[:id])
	end
	def edit
	end
	def update
		@item = Item.find(params[:id])
        if @item.update(item_params)
            redirect_to admins_items_path
        else
            flash[:notice] = "false"
        end
	end
	
	private
	def item_params
		params.require(:item).permit(:genre_id, :name, :description, :image, :is_active, :price)
	end
end