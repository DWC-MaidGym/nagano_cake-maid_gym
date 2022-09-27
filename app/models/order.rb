class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_products, dependent: :destroy

    enum payment_method: { credit_card: 0, transfer: 1 }
    enum status: { wait_payment: 0, confirm_payment:1, making:2, preparing_ship:3, finish_prepare:4 }

    validates :name, presence: true
    validates :status, presence: true
    validates :post_code, presence: true
    validates :address, presence: true



    def add_tax_price
      (self.price * 1.10).round
    end

    def sum_price
      self.product.add_tax_price*self.amount
    end

    def sum_amount
      products = OrderProduct.where(order_id: self.id)
      products.sum(:amount)
    end

    after_update do
      if self.status == "confirm_payment"
        self.order_products.each {|order_product|
        order_product.update(order_status: 1)
        }
      end
    end
end
