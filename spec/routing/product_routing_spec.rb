require 'rails_helper'

RSpec.describe 'routes for products', :type => :routing do
  it 'routes /products to the products controller' do
    expect(get('/products')).to route_to('products#index')
  end
end
