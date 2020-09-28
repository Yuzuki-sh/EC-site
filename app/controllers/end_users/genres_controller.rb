class EndUsers::GenresController < ApplicationController
    before_action :authenticate_end_user!
    def show 
        @genres = Genre.all
        @genre_items = Genre.find(params[:id]).items
    end
end
