require 'rails_helper'

RSpec.describe 'seller management', :type => :request do
  before(:all) do
    @seller = FactoryBot.create(:seller)
    sign_in @seller
  end 
  # it "index page test" do
  #     get "/sellers/sign_up"
  #     expect(response).to have_http_status(200)
  #     get "/sellers/sign_in"
  #     expect(response).to have_http_status(200)
  #      end
  it 'get seller index page' do
    get '/seller'
    expect(response).to render_template(:index)
  end
  it 'does not render a index page' do
    get '/seller'
    expect(response).to_not render_template(:show)
  end
  it 'seller show age' do
    get seller_path(@seller.id)
    expect(response).to redirect_to('/sellers/sign_in')
  end
end
