FactoryBot.define do
  factory :comment do
    text {"ใในใ"}
    association :user
    association :item
  end
end
