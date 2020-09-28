class EndUsers::GenresController < ApplicationController
    before_action :authenticate_end_user!
    def show 
        @genres = Genre.all
        @end_user_items = current_end_user.items
    end
end
