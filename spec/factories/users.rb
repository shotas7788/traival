FactoryBot.define do
  factory :user do
    
  end
  
  factory :user_tanaka, class: 'user' do 
    # profile_photo { 'default.jpg' }
    profile_photo {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/default.jpg'))}
    name { '田中 太郎' }
    username{ 'たなたろ'}
    email { 'taro.tanaka@example.com' }
    password { 'password'}
    password_confirmation { 'password'}
  end
  
  factory :user_suzuki, class: 'user' do 
    # profile_photo { 'default.jpg' }
    profile_photo {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/default.jpg'))}
    name { '鈴木 太郎' }
    username{ 'すずたろ'}
    email { 'taro.suzuki@example.com' }
    password { 'password'}
    password_confirmation { 'password'}
  end
  
  factory :user_satou, class: 'user' do 
    # profile_photo { 'default.jpg' }
    profile_photo {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/default.jpg'))}
    name { '佐藤 太郎' }
    username{ 'さとたろ'}
    email { 'taro.satou@example.com' }
    password { 'password'}
    password_confirmation { 'password'}
  end
end
