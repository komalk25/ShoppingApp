require 'rails_helper'

RSpec.describe SellerController, :type => :controller do
  describe 'anonymous seller' do
    before :each do
      login_with nil
    end
    it 'check' do
      get :index
      response.should render_template('index')
      expect(response).to have_http_status(200)
    end
    it 'should let a user see all the posts' do
      login_with create(:seller)
      get :index
      expect(response).to render_template(:index)
    end
  end
end
