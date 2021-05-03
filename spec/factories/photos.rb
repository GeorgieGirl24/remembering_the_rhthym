FactoryBot.define do
  factory :photo do
    name { "MyString" }
    concert_date { "2021-05-03" }
    loved { false }
    liked { false }
    user { nil }
    concert { nil }
  end
end
