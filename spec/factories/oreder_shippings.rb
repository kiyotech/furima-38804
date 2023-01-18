FactoryBot.define do
  factory :order_shipping do
    association :user
    association :item
    token { 'aaaaaa' }
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.within(range: 2..48) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building { Faker::Address.secondary_address }
    phone_number { Faker::PhoneNumber.subscriber_number(length: 11) }
  end
end
