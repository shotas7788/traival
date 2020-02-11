require 'rails_helper'

RSpec.describe "ユーザーのリクエストテスト", type: :request do
  describe 'GET #show' do
    describe 'ユーザーが存在する場合' do
      before do
        user1 = FactoryBot.create(:user_tanaka)
        get user_url user1.id
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it 'ユーザー名が表示されていること' do
        expect(response.body).to include 'たなたろ'
      end
    end
  end

  describe 'GET #new' do
    it 'リクエストが成功すること' do
      get new_user_registration_path
      expect(response.status).to eq 200
    end
  end

  describe 'GET #edit' do
    before do
      user1 = FactoryBot.create(:user_tanaka)
      sign_in user1
      get edit_user_registration_path
    end

    it 'リクエストが成功すること' do
      expect(response.status).to eq 200
    end

    it 'ユーザー名が表示されていること' do
      expect(response.body).to include 'たなたろ'
    end

    it 'メールアドレスが表示されていること' do
      expect(response.body).to include 'taro.tanaka@example.com'
    end
  end

  describe 'POST #create' do
    context 'パラメータが妥当な場合' do
      before do
        post user_registration_path, params: { user: FactoryBot.attributes_for(:user_tanaka) }
      end
      it 'リクエストが成功すること' do
        expect(response.status).to eq 302
      end

      it 'ユーザーが登録されること' do
        expect(User.last.name).to eq '田中 太郎'
      end

      it 'リダイレクトすること' do
        expect(response).to redirect_to root_path
      end
    end
    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        post user_path(:user_tanaka), params: { user: FactoryBot.attributes_for(:user_tanaka) }
        expect(response.status).to eq 200
      end

      it 'ユーザーが登録されないこと' do
        expect do
          post user_path(:user_tanaka), params: { user: FactoryBot.attributes_for(:user_tanaka) }
        end.to_not change(User, :count)
      end
    end
  end
end