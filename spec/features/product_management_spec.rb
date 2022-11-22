require 'rails_helper'

RSpec.feature 'product management', :type => :feature do
  scenario 'product show page' do
    @product = FactoryBot.create(:product)
    visit product_path(@product)
    expect(page).to have_content('Add to Cart')
    click_button('Add to Cart')
    expect(current_path).to eq('/users/sign_in')
  end
end
