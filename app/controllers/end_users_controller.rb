class EndUsersController < ApplicationController
    def top 

    end
    def show
        @user = current_end_user
    end
    def withdrow

    end
    def switch
        #is_deletedカラムにフラグを立てる(defaultはfalse)
        current_end_user.update(is_active: false)
        #ログアウトさせる
        reset_session
        redirect_to root_path
    end
end
