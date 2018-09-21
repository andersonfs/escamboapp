class Checkout::NotificationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create

  def create
    transaction = PagSeguro::Transaction.find_by_notification_code(params[:notificationCode])

    if transaction.errors.empty?
      status_code = transaction.status.id.to_i
      order_id = transaction.reference.to_i

      order = Order.find(order_id)
      order.stars = status_code
      order.save

      if status_code == 3
        ad = Ad.find(order.ad.id)
        ad.done!
      end
    end

    render nothig: true, status: 200
  end

end
