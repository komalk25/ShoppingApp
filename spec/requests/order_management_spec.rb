require 'rails_helper'

RSpec.describe 'order management', :type => :request do
  before(:each) do
    @user = FactoryBot.create(:user)
    @order = FactoryBot.create(:order, :user_id => @user.id)
    @cart = FactoryBot.create(:cart, :user_id => @user.id)
    sign_in @user
  end
  it 'orders flow' do
    get user_path(@user)
    expect(response).to render_template('users/show')
  end
end
