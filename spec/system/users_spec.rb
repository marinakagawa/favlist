require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  #ユーザーは新しく名前を登録する
  scenario "user sets a new name" do
    user = FactoryBot.create(:user)
    visit root_path
    click_link "ログイン"

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "ログイン"

    click_link "アカウント設定"
    fill_in "user[user_name]", with: "テスト"
    click_button "設定を保存する"

    click_link "FavList"
    expect(page).to have_content "テスト"
  end
end
