class OrderProduct < ApplicationRecord
    belongs_to :order
    belongs_to :product

    enum order_status: { not_make: 0, wait_make: 1, making: 2, make_end: 3 }
    def add_tax_price
      (self.price * 1.10).round
    end

    def sum_price
      self.product.add_tax_price*self.amount
    end

end
