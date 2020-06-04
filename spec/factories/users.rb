FactoryBot.define do
  factory :user do
    username { FFaker::Internet.unique.user_name }
    email { FFaker::Internet.unique.email }
    password { FFaker::Internet.password }
  end
end
