require 'rails_helper'

RSpec.describe 'コメント投稿', type: :system do
  before do
    @tweet = FactoryBot.create(:tweet)
    @comment = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーはツイート詳細ページでコメント投稿できる' do
    visit new_user_session_path
    fill_in 'Email', with: @tweet.user.email
    fill_in 'Password', with: @tweet.user.password
    binding.pry
    find('input[name="commit"]').click
  end
end
