require 'rails_helper'

RSpec.describe Bookmark, type: :model do

  #user_idがなければ無効な状態であること
  it "is invalid without an user_id" do
    bookmark = FactoryBot.build(:bookmark, user_id: nil)
    bookmark.valid?
    expect(bookmark.errors[:user_id]).to include("を入力してください")
  end

  #空欄であれば無効な状態であること
  it "is invalid without a link" do
    bookmark = FactoryBot.build(:bookmark, link: " ")
    bookmark.valid?
    expect(bookmark.errors[:link]).to include("を入力してください")
  end

  #URLであれば有効な状態であること
  it "is valid with url" do
    expect(FactoryBot.create(:bookmark)).to be_valid
  end

  #URLでなければ無効な状態であること
  it "is invalid without url" do
    bookmark = FactoryBot.build(:bookmark, link: "こんにちは世界")
    bookmark.valid?
    expect(bookmark.errors[:link]).to include("は不正な値です")
  end
end
