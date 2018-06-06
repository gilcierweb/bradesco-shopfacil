require 'base64'
require 'rest-client'

require 'bradesco_shopfacil/version'
require 'bradesco_shopfacil/buyer'
require 'bradesco_shopfacil/buyer_address'
require 'bradesco_shopfacil/bank_slip'
require 'bradesco_shopfacil/bank_slip_instructions'
require 'bradesco_shopfacil/order'

module BradescoShopfacil

  class Shopfacil

    include Order, Buyer, BankSlip

    attr_accessor :media_type, :charset, :sandbox, :token_request_confirmation_payment

    URL_HOMOLOGACAO = 'https://homolog.meiosdepagamentobradesco.com.br'
    URL_PRODUCAO = 'https://meiosdepagamentobradesco.com.br'

    def media_type
      @media_type ||= 'application/json'
    end

    def charset
      @charset ||= 'UTF-8'
    end

    def sandbox
      @sandbox ||= false
    end

    def initialize(merchant_id, security_key)
      @merchant_id = merchant_id
      @security_key = security_key
    end

    def data_service_request

      service_request = {
          "merchant_id" => @merchant_id,
          "meio_pagamento" => "300",
          "pedido" => data_service_order,
          "comprador" => data_service_buyer,
          "boleto" => data_service_bank_slip,
          "token_request_confirmacao_pagamento" => token_request_confirmation_payment
      }
      service_request

      send_data('/apiboleto/transacao', service_request)

    end

    def send_data(params_url, params_data = nil)

      if sandbox
        url_bradesco = URL_HOMOLOGACAO
      else
        url_bradesco = URL_PRODUCAO
      end

      url = "#{url_bradesco}#{params_url}"

      authorization_header = "#{@merchant_id}:#{@security_key}"
      authorization_header_base64 = Base64.encode64(authorization_header)

      headers = {
          accept: media_type,
          accept_charset: charset,
          accept_encoding: media_type,
          # content_type: :json,
          content_type: "#{media_type};charset=#{charset}",
          Authorization: " Basic #{authorization_header_base64}"
      }

      response = RestClient.post url, params_data.to_json, headers

      response.body

    end

  end

end