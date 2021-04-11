class OrderDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :delivery_area_id, :municipal_district, :address, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, :municipal_district, :address, :phone_number
  end
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\Z/,message: "is invalid. Include hyphen(-)" }
  validates :phone_number, format: { with: /\A[0-9]{3,11}\Z/ }
  validates :delivery_area_id, numericality: { other_than: 1 }

  def save
    binding.pry
    #user = User.find(params[:id])
    #item = Item.find(params[:item_id])
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, delivery_area_id: delivery_area_id, municipal_district: municipal_district, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end