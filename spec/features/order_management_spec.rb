require 'rails_helper'

RSpec.feature 'order management' do
  before(:each) do
    @user = FactoryBot.create(:user)
    @order = FactoryBot.create(:order, :user_id => @user.id)
    @cart = FactoryBot.create(:cart, :user_id => @user.id)
    login_as(@user, :scope => :user)
  end
  it 'orders flow' do
    visit user_path(@user)
    expect(page).to have_content('Deliver to this address')
    click_button('Deliver to this address')
    expect(current_path).to eq(orders_path)
  end
end
