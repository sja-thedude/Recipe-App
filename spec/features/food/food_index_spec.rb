require 'rails_helper'

RSpec.feature 'Food Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Testing', email: 'user@example.com', password: 'password')
    @food = Food.create(name: 'apple', measurementUnit: 'kg', price: 10, user: @user)
    visit user_session_path
    fill_in 'email', with: 'user@example.com'
    fill_in 'pwd', with: 'password'
    click_button 'Log in'
  end

  it 'user can see inputs and button' do
    visit user_session_path
    expect(page).to have_current_path(root_path)
  end

  it 'show All Food heading' do
    expect(page).to have_content 'All Foods'
  end

  it 'show food name' do
    expect(page).to have_content @food.name
  end

  it 'show food price' do
    expect(page).to have_content @food.price
  end

  it 'check the user image' do
    expect(page).to have_selector('a')
  end

  it 'Navigate to the create food' do
    click_link('Add food')
    expect(page).to have_current_path(new_food_path)
  end
end
