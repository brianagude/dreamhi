class OrderMailer < ApplicationMailer

  def receipt(order)
    @order = order

    mail to: @order.email, subject: 'Your Dreamhi Order'
  end
end
