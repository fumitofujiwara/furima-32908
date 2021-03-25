FactoryBot.define do
  factory :item do
    name             { 'アイウエオ' }
    description      { 'アイウエオカキクケコ' }
    category_id      { 2 }
    status_id        { 2 }
    delivery_fee_id  { 2 }
    delivery_area_id { 2 }
    delivery_date_id { 2 }
    selling_price    { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
