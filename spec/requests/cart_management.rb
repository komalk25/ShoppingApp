require 'rails_helper'

RSpec.describe 'cart management', :type => :request do
  before(:each) do
    @cart = FactoryBot.create(:cart)
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  it 'carts page flow' do
    get cart_path(@cart)
    expect(response).to render_template(:show)
  end
end
