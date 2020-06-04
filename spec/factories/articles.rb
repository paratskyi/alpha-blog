FactoryBot.define do
  factory :article do
    title { FFaker::Book.title }
    description { FFaker::Book.description }
    user_id { 1 }
  end
end
