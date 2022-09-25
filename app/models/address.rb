class Address < ApplicationRecord
    belongs_to :customer, dependent: :destroy
    
    def address_display
      '〒' + post_code + ' ' + address + ' ' + name 
    end
    
end
