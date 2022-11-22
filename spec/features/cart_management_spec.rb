require 'rails_helper'

RSpec.feature 'cart management' do
  before(:each) do
    @user = FactoryBot.create(:user)
    @cart = FactoryBot.create(:cart, user_id: @user.id)
    login_as(@user, :scope => :user)
  end
  scenario 'carts show page' do
    visit cart_path(@cart)
    expect(page).to have_content('checkout')
    click_link('checkout')
    expect(current_path).to eq("/users/#{@user.id}")
  end
end
