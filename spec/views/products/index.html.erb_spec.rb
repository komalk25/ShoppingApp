require 'rails_helper'

RSpec.describe 'products/index' do
  it 'display all product' do
    seller = FactoryBot.create(:seller)
    image = Rack::Test::UploadedFile.new(Rails.root.join('bin.png'), 'bin/png')
    assign(:products, [Product.create!(:title => 'women top', :description => 'regular fit round neck top',
     :price => 789.0, :seller_id => seller.id, :image => image)])
    render
  end
end
