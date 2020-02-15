FactoryBot.define do
  factory :post, class: Post do
    user_tanaka
    caption { 'キャプション' }
    trait :invalid do
      caption {''}
    end
  end
end