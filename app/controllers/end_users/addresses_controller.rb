class EndUsers::AddressesController < ApplicationController
	before_action :authenticate_end_user!
	def index
		@address = Address.new
		@addresses = Address.all
	end
	def edit 
		@address = Address.find(params[:id])
	end
	def create
		address = Address.new(address_params)
		if address.save
			redirect_to end_users_addresses_path
		end
	end
	def update
		address = Address.find(params[:id])
		if address.update(address_params)
			redirect_to end_users_addresses_path
		end
	end
	def destroy
		address = Address.find(params[:id])
		address.destroy
		redirect_to end_users_addresses_path
	end

	private
	def address_params
        params.require(:address).permit(:end_user_id, :postal_code, :address, :name)
	end
end
