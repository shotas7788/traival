FactoryBot.define do
  factory :photo, class: Photo do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/unsplash2.jpg')) }
    
    trait :for_post do
      association :post, factory: :post
    end
    # created_at       { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    # updated_at       { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
  end
end
