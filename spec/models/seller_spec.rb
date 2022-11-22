require 'rails_helper'

RSpec.describe Seller, :type => :model do
  before(:all) do
    @seller = FactoryBotRails(:seller)
  end
  it 'is valid with valid attributes' do
    expect(@seller).to be_valid
  end
end
