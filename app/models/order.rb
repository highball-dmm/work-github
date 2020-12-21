class Order < ApplicationRecord

    belongs_to :customer
    has_many :order_items


    enum payment_method: {"クレジットカード": 0, "銀行振り込み": 1}
    enum order_status: {"入金待ち": 0, "入金確認": 1, "制作中": 2, "発送準備中": 3, "発送済み": 4}


    # def total_price
    #   小計  + 送料
    # end

    def sub_price
        @sum = 0
        @cart_items.each do |cart|
            (cart.product.non_taxed_price * 1.1 * cart.item_quantity).floor
            @sum += (cart.product.non_taxed_price * 1.1 * cart.item_quantity).floor
        end
    end

end
