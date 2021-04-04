class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area, :municipal_district, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :postal_code, :municipal_district, :address, :building_name, :phone_number
  end
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\Z/,message: "is invalid. Include hyphen(-)" }
  validates :phone_number, numericality: { less_than_or_equal_to: 11 }

  def save
    Order.create(token: token, user_id: user.id, item_id: item.id)
    Delivery.create(postal_code: postal_code, delivery_area: delivery_area, municipal_district: municipal_district, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end