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

    after_update do
    order_product = self.order.order_products
    if order_product.all? {|order_product| order_product.order_status == "make_end"} == true # 条件分岐：製作ステータスが全て製作完了だったら
      self.order.update(status: "preparing_ship") # 注文ステータスを発送準備中に変更する
    end
  end

end
