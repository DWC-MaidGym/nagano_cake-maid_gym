class CartProduct < ApplicationRecord
    belongs_to :customer
    belongs_to :product
    
    def sum_price 
        self.product.add_tax_price * self.amount
    end
end
