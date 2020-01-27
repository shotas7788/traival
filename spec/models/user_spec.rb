require 'rails_helper'

RSpec.describe User, type: :model do
  describe '正常系の機能' do
    context 'ユーザー登録する' do
      it '正しく登録できること 名前：田中太郎、ユーザーネーム：たなたろ、
          email: taro.tanaka@example.com' do
        user = FactoryBot.build(:user_tanaka)
        expect(user).to be_valid

        user.save
        
        registared_user = User.last;
        
        expect(registared_user.name).to eq('田中 太郎')
        expect(registared_user.email).to eq('taro.tanaka@example.com')
        expect(registared_user.username).to eq('たなたろ')
      end
    end
  end
  
  describe '異常系の機能' do
    context 'ユーザー登録に失敗' do
      it '名前がnilのときに登録できないこと' do
        user = User.new(name: "", username: "たなたろ", email: "tanaka@test.co.jp") 
        expect(user).not_to be_valid
      end
      it 'ユーザーネームがnilのときに登録できないこと' do
        user = User.new(name: "田中", username: "", email: "tanaka@test.co.jp") 
        expect(user).not_to be_valid
      end
      it 'メールアドレスがnilのときに登録できないこと' do
        user = User.new(name: "田中", username: "たなたろ", email: "") 
        expect(user).not_to be_valid
      end
    end
  end
end
