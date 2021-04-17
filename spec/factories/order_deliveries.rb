FactoryBot.define do
  factory :order_delivery do
    token              { 'tok_abcdefghijk00000000000000000' }
    postal_code        { '000-0000' }
    delivery_area_id   { 2 }
    municipal_district { '大分' }
    address            { '大分123' }
    building_name      { '大分ハイツ123' }
    phone_number       { '11111111111' }
  end
end
