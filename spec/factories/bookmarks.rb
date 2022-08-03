FactoryBot.define do
  factory :bookmark do
    link { "https://fav-list.herokuapp.com" }
    association :user
  end
end
