require 'rails_helper'

RSpec.describe User, type: :model do

  #emailとパスワードがあれば有効な状態であること
  it "is valid with an email and password" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  #emailがなければ無効な状態であること
  it "is invalid without an email" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  #重複したemailなら無効な状態であること
  it "is invalid with a duplicate email" do
    FactoryBot.create(:user, email: "test@example.com")

    user = FactoryBot.build(:user, email: "test@example.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end
end
