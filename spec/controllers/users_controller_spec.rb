require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { FactoryBot.create(:user) }
  let(:task) { FactoryBot.create(:post, user: user) }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template('index')
      expect(assigns(:tasks)).to eq []
    end
  end
  
  describe 'POST #new' do
    it 'returns http success' do
      post :create, params: { post: { caption: '123', profile_photo {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/default.jpg'))} } }
      expect(response).to have_http_status(302)
      expect(Post.all.count).to eq 1
      expect(Post.all.take.title).to eq '123'
      expect(Post.all.take.profile_photo).to eq "default.jpg"
      expect(Post.all.take.user).to eq user
      expect(Post.all.take.completed_at).to eq nil
      expect(Post.all.take.completed).to eq false
    end
  end
  
end