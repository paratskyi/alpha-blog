require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  let(:category) { FactoryBot.build :category }

  it 'visiting the index' do
    visit categories_path
    expect(page).to have_selector('h1', text: 'Categories')
  end

  it 'creating a Category' do
    # visit :categories
    # click_button 'New Category'
    visit new_category_path
    page.fill_in :name, with: category.name
    click_button 'Create Category'
    expect(page).to have_content 'Category was successfully created'
    expect(page).to have_content category.name
    expect(page).to have_current_path(category_path(Category.last))
    # click_button 'Back'
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
