require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  let(:category) { FactoryBot.build :category }
  let(:admin_user) { FactoryBot.create :user, admin: true }
  before do
    visit :login
    page.fill_in :session_email, with: admin_user.email
    page.fill_in :session_password, with: admin_user.password
    click_button 'Log in'
  end

  it 'creating a Category' do
    # visit :categories
    # click_button 'New Category'
    visit new_category_path
    page.fill_in :name, with: category.name
    click_button 'Create Category'
    expect(page).to have_current_path(category_path(Category.last))
    expect(page).to have_content 'Category was successfully created'
    expect(page).to have_content category.name
    # click_button 'Back'
    click_link('Logout')
  end

  it 'creating a category with invalid submission' do
    # visit :categories
    # click_button 'New Category'
    visit new_category_path
    page.fill_in :name, with: ''
    click_button 'Create Category'
    expect(page).to have_content 'The following errors prevented the category from being saved'
    expect(page).to have_selector('h4.alert-heading')
    # click_button 'Back'
    click_link('Logout')
  end

  it 'should show categories listing' do
    categories = FactoryBot.create_list(:category, 2)
    visit categories_path
    categories.each do |category|
      expect(page).to have_link(category.name, href: category_path(category))
    end
    click_link('Logout')
  end

  # it 'updating a Category' do
  #   visit categories_path
  #   click_button 'Edit'
  #   click_button 'Update Category'
  #   expect(page).to have_content 'Category was successfully updated'
  #   click_button 'Back'
  # end

  # it 'destroying a Category' do
  #   visit categories_path
  #   accept_confirm do
  #     click_button 'Destroy'
  #   end
  #   expect(page).to have_content 'Category was successfully destroyed'
  # end
end
