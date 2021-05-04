FactoryBot.define do
  factory :user do
    name { "Jim Smith" }
    email { "jim@example.com" }
    password_digest { "lkdjfldjfdljf" }
  end
end
