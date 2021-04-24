class Favorite < ApplicationRecord
  belogns_to :user
  belongs_to :item
end
