require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let(:category) { FactoryBot.build :category }
  let(:admin_user) { FactoryBot.create :user, admin: true }
  describe 'GET /new' do
    it 'returns http success' do
      sign_in_as(admin_user)
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
      category.save
      get categories_path(category)
      expect(response).to have_http_status(:success)
    end
  end

  it 'should create category' do
    sign_in_as(admin_user)
    expect do
      post categories_path, params: { category: { name: category.name } }
    end.to change { Category.count }.by(1)
    redirect_to(assigns(Category.last))
  end

  it 'should not create category if not admin' do
    expect do
      post categories_path, params: { category: { name: category.name } }
    end.to change { Category.count }.by(0)
    redirect_to :categories
  end

  it 'should not create category' do
    expect do
      post categories_path, params: { category: { name: '' } }
    end.to change { Category.count }.by(0)
    redirect_to(assigns(Category.last))
  end
end
