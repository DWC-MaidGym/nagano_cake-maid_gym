class Product < ApplicationRecord
    belongs_to :genre
    has_many :cart_products, dependent: :destroy
    has_many :order_products, dependent: :destroy
    
    validates :name, presence: true
    validates :introduction, presence: true
    validates :genre_id, presence: true
    validates :price, presence: true
    validates :is_active, presence: true

    has_one_attached :image_id
    
    def get_image_id
        (image_id.attached?) ? image_id : 'no_image.jpg'
    end
    
    def add_tax_price
        (self.price * 1.1).round
    end

end
