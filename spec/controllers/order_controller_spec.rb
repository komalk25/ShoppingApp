require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do
  let(:user){
    
  }
  valid_params: {
    current_user: user.id
  }
  it "send confirmation mail after order confirmation" do
    expect{ post :create, :current_user}.to change { ActionMailer::Base.deliveries.count }.by(1)
  end  
end