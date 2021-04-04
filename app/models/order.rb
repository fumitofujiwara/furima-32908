class Order < ApplicationRecord
  belogns_to :user
  belongs_to :item
  has_one :order
end
