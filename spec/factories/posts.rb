FactoryBot.define do
  factory :post, class: Post do
    caption { 'キャプション' }
    user_id { user_tanaka.id }
  end
end