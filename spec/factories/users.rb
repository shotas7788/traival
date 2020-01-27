FactoryBot.define do
  factory :user do
    
  end
  
  factory :user_tanaka, class: 'user' do 
    # profile_photo { 'default.jpg' }
    name { '田中 太郎' }
    username{ 'たなたろ'}
    email { 'taro.tanaka@example.com' }
    password { 'password'}
    password_confirmation { 'password'}
  end
end
