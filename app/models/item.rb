class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :delivery_date

  with_options presence: true do
    validates :image, :name, :description, :category_id, :status_id, :delivery_fee_id, :delivery_area_id, :delivery_date_id, :selling_price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id, :delivery_fee_id, :delivery_area_id, :delivery_date_id
  end

  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  validates :selling_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: {with: /\A[\d]+\Z/}
end
