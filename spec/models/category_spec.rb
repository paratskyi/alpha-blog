require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryBot.create :category }

  it 'should be valid' do
    expect(category).to be_valid
  end
end
