FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'abcd12' }
    password_confirmation { password }
    last_name             { '一あア' }
    first_name            { '一あア' }
    last_name_furigana    { 'テスト' }
    first_name_furigana   { 'テストー' }
    birthday              { '1992-01-09' }
  end
end
