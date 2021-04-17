class Delivery < ApplicationRecord
  belongs_to :order
  belongs_to :delivery_area

  extend ActiveHash::Associations::ActiveRecordExtensions
end
