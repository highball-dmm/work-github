class Order < ApplicationRecord

    belongs_to :customer
    has_many :cart_items, dependent: :destroy

    enum order_status: {"着手不可": 0, "制作待ち": 1, "製作中": 2, "製作完了": 3}

end
