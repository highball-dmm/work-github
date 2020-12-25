module ApplicationHelper

  def current_cart
    @cart_items = current_customer.cart_items
  end

    # 小数点切り捨てはfloor,３桁区切りはto_s(:delimited)
  # 税込の計算
  def tax_price(price)
    (price * 1.1).floor
  end

    # 小計の計算
  def sub_price(sub)
    (tax_price(sub.product.non_taxed_price) * sub.item_quantity)
  end

    # 合計金額の計算
  def total_price(totals)
    price = 0
    totals.each do |total|
      price  +=  sub_price(total)
    end
    return price
  end

    # 請求額の計算
  def billing(order)
    total_price(current_cart) + order.shipping.to_i
  end

	def full_name(customer)
		customer.first_name + customer.last_name
	end

	def kana_full_name(customer)
		customer.kana_first_name + customer.kana_last_name
	end
end
