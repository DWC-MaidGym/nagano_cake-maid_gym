class HomesController < ApplicationController
    def top
        @products = Product.limit(4).order(" created_at DESC ")
    end
end
