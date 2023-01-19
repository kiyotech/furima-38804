class OrderShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :token,
                :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building,
                    phone_number: phone_number, order_id: order.id)
  end
end
