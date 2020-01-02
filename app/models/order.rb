class Order < ApplicationRecord
  has_many :order_items

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true

  accepts_nested_attributes_for :order_items

  def add_from_cart(cart)
    cart.order_items.all.each do |item|
      self.order_items.build(product: item.product, quantity: item.quantity)
    end
  end

  def save_and_charge
    if self.valid?
      begin
        Stripe::Charge.create({
                                  amount: self.total_price.to_int,
                                  currency: "usd",
                                  source: self.stripe_token,
                                  description: "Order for " + self.email})
        self.save
      rescue Stripe::CardError => e
        puts "Status is: #{e.http_status}"
        puts "Type is: #{e.error.type}"
        puts "Charge ID is: #{e.error.charge}"
        # The following fields are optional
        puts "Code is: #{e.error.code}" if e.error.code
        puts "Decline code is: #{e.error.decline_code}" if e.error.decline_code
        puts "Param is: #{e.error.param}" if e.error.param
        puts "Message is: #{e.error.message}" if e.error.message
        @message = e.json_body[:error][:message]
        self.errors.add(:stripe_token, @message)
        e.error.message
      rescue Stripe::RateLimitError => e
        # Too many requests made to the API too quickly
        puts "Too many requests made to the API too quickly"
        puts "ERROR: #{e}"
        e.error.message
      rescue Stripe::InvalidRequestError => e
        # Invalid parameters were supplied to Stripe's API
        puts "Invalid parameters were supplied to Stripe's API"
        puts "ERROR: #{e}"
        e.error.message
      rescue Stripe::AuthenticationError => e
        # Authentication with Stripe's API failed
        # (maybe you changed API keys recently)
        puts "Authentication with Stripe's API failed"
        puts "ERROR: #{e}"
        e.error.message
      rescue Stripe::APIConnectionError => e
        # Network communication with Stripe failed
        puts "Rate Limit Error"
        puts "ERROR: #{e}"
        e.error.message
      rescue Stripe::StripeError => e
        # Display a very generic error to the user, and maybe send
        # yourself an email
        puts "Standard Error"
        puts "ERROR: #{e}"
        e.error.message
      rescue => e
        # Something else happened, completely unrelated to Stripe
        puts "Error not related to stripe"
        puts "ERROR: #{e}"
      end
    else
      false
    end
  end


  def total_price
    @total = 0

    order_items.each do |item|
      @total = @total + item.product.price * item.quantity * 100
    end

    @total
  end


  def total_price_in_dollars
    @total = 0

    order_items.all.each do |item|
      @total = @total + item.product.price_in_dollars * item.quantity
    end

    @total
  end

end
