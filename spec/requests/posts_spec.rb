require 'rails_helper'

RSpec.describe "投稿のリクエストテスト", type: :request do
  describe "GET #index" do
    context 'ログイン指定ない場合' do
      it "ログインページが表示される" do
        get new_user_session_path
        expect(response.status).to eq(200)
      end
    end
    context 'ログインしている場合' do
      before do
        user1 = FactoryBot.create(:user_tanaka)
        sign_in user1
      end
      it "投稿一覧が表示される" do
        get posts_path
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET #new' do
    context 'ログイン指定ない場合' do
      it 'リダイレクトされること' do
        get new_post_path
        expect(response.status).to eq 302
      end
    end

    context 'ログインしている場合' do
      before do
        user1 = FactoryBot.create(:user_tanaka)
        sign_in user1
      end

      it 'リクエストが成功すること' do
        get new_post_path
        expect(response.status).to eq 200
      end
    end
  end

  describe 'POST #create' do
    context 'パラメータが妥当な場合' do
      before do
        user1 = FactoryBot.create(:user_tanaka) do |p|
          p.posts.create(FactoryBot.attributes_for(:post)) 
        end
        # user1 = FactoryBot.create(:user_tanaka)
        sign_in user1
        post posts_url, params: { post: FactoryBot.attributes_for(:post) }
      end
      it 'リクエストが成功すること' do
        expect(response.status).to eq 302
      end

      it '投稿が作成されていること' do
        expect(Post.last.caption).to eq 'キャプション'
      end
    end
  end
end