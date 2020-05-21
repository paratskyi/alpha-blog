require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let(:category) { FactoryBot.create :category }
  describe 'GET /new' do
    it 'returns http success' do
      get new_category_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get categories_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get categories_path(category)
      expect(response).to have_http_status(:success)
    end
  end

  it 'should create category' do
    expect do
      post categories_path, params: { category: { name: 'Travel' } }
    end.to change { Category.count }.by(1)
    redirect_to(assigns(Category.last))
  end
end
