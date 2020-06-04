require 'ffaker'

FactoryBot.define do
  factory :category do
    name { FFaker::Lorem.characters(3) }
  end
end
