require 'rails_helper'

RSpec.describe 'product management', :type => :request do
  before(:all) do
    @seller = FactoryBot.create(:seller)
    sign_in @seller
  end
  it 'get index page' do
    get '/products'
    expect(response).to render_template(:index)
  end
  it 'does not render a index page' do
    get '/products'
    expect(response).to_not render_template(:show)
  end
  it 'project root page' do
    get root_path
    expect(response).to render_template(:index)
  end
  it 'index to show flow' do
    @product = FactoryBot.create(:product)
    get product_path(@product)
    expect(response).to render_template(:show)
    expect(response.body).to include('Add to Cart')
  end
end
