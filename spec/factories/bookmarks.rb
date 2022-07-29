FactoryBot.define do
  factory :bookmark do
    link { "https://fav-list.herokuapp.com" }
    user { FactoryBot.build(:user) }
  end
end
