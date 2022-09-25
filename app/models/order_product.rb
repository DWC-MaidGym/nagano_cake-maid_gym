class OrderProduct < ApplicationRecord
    belongs_to :order
    belongs_to :product
    
    def add_tax_price
      (self.price * 1.10).round
    end

    def sum_price
      self.product.add_tax_price*self.amount
    end

end
