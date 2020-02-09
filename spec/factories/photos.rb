FactoryBot.define do
  factory :photo do
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/unsplash2.jpg'))}
  end
end
