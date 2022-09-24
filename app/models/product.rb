class Product < ApplicationRecord
    belongs_to :genre
    has_many :cart_products, dependent: :destroy
    has_many :order_products, dependent: :destroy
    
    def add_tax_price
        (self.price * 1.10).round
    end

end
