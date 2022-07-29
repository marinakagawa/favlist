require 'rails_helper'

RSpec.describe Bookmark, type: :model do

  #user_idがなければ無効な状態であること
  it "is invalid without an user_id" do
    bookmark = FactoryBot.build(:bookmark, user_id: nil)
    bookmark.valid?
    expect(bookmark).to_not be_valid
  end

  #user_idがあれば有効な状態であること
  it "is valid with an user_id" do
    expect(FactoryBot.build(:bookmark)).to be_valid
  end
end
