require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryBot.create :category }

  def build_custom_category(**params)
    FactoryBot.build(:category, params)
  end

  it 'should be valid' do
    expect(category).to be_valid
  end

  it 'name should be presetnt' do
    expect(build_custom_category(name: ' ')).not_to be_valid
  end

  it 'name should be unique' do
    expect(build_custom_category(name: category.name)).not_to be_valid
  end

  it 'name should not be too long' do
    expect(build_custom_category(name: 'a' * 26)).not_to be_valid
  end

  it 'name should not be too short' do
    expect(build_custom_category(name: 'aa')).not_to be_valid
  end
end
