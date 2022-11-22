require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:seller) {
    Seller.new(:email => 'komal@gmail.com',:name => 'komal')
  }
  subject {
    described_class.new(
      title: 'woment top',
      description: 'regular fit, round neck top',
      price: 345.5,
      image: 'image.jpg',
      seller_id: 1
    )
  }
  it 'valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'not valid without a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end
  it 'not valid without a price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end
  describe 'Associations' do
    it { should belong_to(:seller) }
  end
end
