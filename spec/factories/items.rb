FactoryBot.define do
  factory :item do
    association :user
    item_name { Faker::Lorem.characters(number: 30) }
    info { Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false) }
    category_id { Faker::Number.within(range: 2..11) }
    sales_status_id { Faker::Number.within(range: 2..7) }
    shipping_fee_status_id { Faker::Number.within(range: 2..3) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    scheduled_delivery_id { Faker::Number.within(range: 2..4) }
    price { Faker::Number.number(digits: 5) }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
