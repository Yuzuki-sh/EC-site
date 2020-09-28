class Order < ApplicationRecord
	belongs_to :end_user
	has_many :order_details

	enum payment:{
		cash: 0,
		credit: 1
	}
	enum orders_status:{
		waiting_for_payment: 0,
		confirmation_payment: 1,
		preparing_for_shipping: 2,		
		sent: 3,
		arrival: 4
	}
	attr_accessor :address_option
	attr_accessor :address_id
end
