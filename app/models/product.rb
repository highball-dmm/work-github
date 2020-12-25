class Product < ApplicationRecord

  attachment :products_image

  belongs_to :genre
  has_many :cart_items
  has_many :orders, through: :order_items
  has_many :order_items


  enum sale_status: {"販売中": true, "売り切れ": false }

  validates :genre_id, :name, :non_taxed_price, presence: true
  validates :products_explanation, length: {maximum: 100}
  validates :non_taxed_price, numericality: { only_integer: true }

end
