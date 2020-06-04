require 'ffaker'

FactoryBot.define do
  factory :category do
    name { FFaker::Food.fruit }
  end
end
