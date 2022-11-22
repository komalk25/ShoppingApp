module ControllerHelpers
  def login_with(seller = double('seller'), scope = :seller)
    current_seller = "current_#{scope}".to_sym
    if Seller.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => scope })
      allow(controller).to receive(current_seller).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(seller)
      allow(controller).to receive(current_seller).and_return(seller)
    end
  end
end
