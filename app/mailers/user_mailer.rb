class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation(user,order)
    puts user
    puts user.email
    @order = order
    @user = user
    puts @user.email
    mail(to: @user.email, subject: "Order confirmation #{@order.id}")
  end
end
