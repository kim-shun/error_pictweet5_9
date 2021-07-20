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
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)

    visit tweet_path(@tweet)
    fill_in 'comment_text', with: @comment
    expect{
      find('input[name="commit"]').click
    }.to change { Comment.count }.by(1)
    expect(current_path).to eq tweet_path(@tweet)
    expect(page).to have_content @comment
  end
end
