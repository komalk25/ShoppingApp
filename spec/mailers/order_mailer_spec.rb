require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  let(:user){
    User.new(:email => 'k@gmail.com')
  }
  let(:mail) { OrderMailer.order_confirm(user) }

  it "renders the headers" do
    expect(mail.subject).to eq("OrderConfirm")
    expect(mail.to).to eq(["k@gmail.com"])
    expect(mail.from).to eq(["sunitakhilari24@gmail.com"])
  end

  it "renders the body" do
    expect(mail.body.encoded).to match("Hi")
  end

end
