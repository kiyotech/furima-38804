FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    email { Faker::Internet.free_email }
    password { Faker::Alphanumeric.alphanumeric(number: 7) }
    password_confirmation { password }
    nickname { Faker::Name.initials(number: 2) }
    first_name { Faker::Japanese::Name.first_name }
    last_name { Faker::Japanese::Name.last_name }
    first_name_kana { person.first.katakana }
    last_name_kana { person.last.katakana }
    birth_date { Faker::Date.backward }
  end
end
