class OrderMailer < ApplicationMailer
    
    def order_confirm(user)
        @user = user
        mail to: @user.email, subject: "OrderConfirm"
    end    
end
