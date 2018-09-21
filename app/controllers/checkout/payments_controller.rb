class Checkout::PaymentsController < ApplicationController

  def create
    #Email: c31944527509479925357@sandbox.pagseguro.com.br
    #Senha: 549734869Pk305dF
    #Cartao: 4111111111111111 / Bandeira: VISA Válido até: 12/2030 CVV: 123

    ad = Ad.find(params[:ad_id])
    ad.processing!

    order = Order.create(ad: ad, buyer_id: current_member.id )
    order.waiting!

    payment = PagSeguro::PaymentRequest.new
    # Uma melhoria seria criar um campo id da transação
    payment.reference = order.id
    payment.notification_url = checkout_notifications_url
    payment.redirect_url = site_ad_detail_url(ad)

    payment.items << {
        id: ad.id,
        description: ad.title,
        amount: ad.price.to_s.gsub(',','.')
    }

    response = payment.register

    if response.errors.any?
      redirect_to site_ad_detail_path(ad), alert: "Erro ao processar compra... Entre em contato com o SAC (21) 0800-9090"
    else
      redirect_to response.url
    end

    render text: "Processando.... Pedido: #{order.status_i18n} - Anúncio: #{ad.status_i18n}"
  end

end
