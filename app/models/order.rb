class Order < ApplicationRecord
  belongs_to :user
  has_many :orders_items
  has_many :items, through: :orders_items
  validates :user_id, :status, presence: true

  enum status: %w(ordered paid cancelled completed)

  def total_order_price
  	sanitize_price(items.sum(:price))
  end

  def item_quantity(item)
  	id = item.id
  	items.where(id: id).count
  end

  def item_subtotal(item)
  	id = item.id
  	sanitize_price(items.where(id: id).sum(:price))
  end

  def sanitize_price(price)
    sprintf('%.2f', price)
  end

end
