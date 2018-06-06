require 'sinatra'
require 'rest-client'
require "base64"
require_relative 'bradesco_shopfacil'

get '/' do
  request.user_agent

  merchant_id = "90000"
  security_key = "SUA CHAVE"

  bradesco_shopfacil = BradescoShopfacil::Shopfacil.new(merchant_id, security_key)

  bradesco_shopfacil.sandbox = true

  bradesco_shopfacil.order_value = 15000
  bradesco_shopfacil.order_number = "GilcierWeb_#{Date.today}"
  bradesco_shopfacil.order_description = 'Descritivo do pedido'

  bradesco_shopfacil.buyer_name = "Nome do comprador/Pagador"
  bradesco_shopfacil.buyer_document = "38604763007"

  bradesco_shopfacil.buyer_address_zip_code = "02010700"
  bradesco_shopfacil.buyer_address_patio = "Rua Domingos Sergio dos Anjos"
  bradesco_shopfacil.buyer_address_number = "277"
  bradesco_shopfacil.buyer_address_complement = ""
  bradesco_shopfacil.buyer_address_neighborhood = "Jardim Santo Elias"
  bradesco_shopfacil.buyer_address_city = "Sao Paulo"
  bradesco_shopfacil.buyer_address_state = "SP"

  bradesco_shopfacil.bank_slip_beneficiary = "GilcierWeb TI"
  bradesco_shopfacil.bank_slip_wallet = '26'
  bradesco_shopfacil.bank_slip_our_number = "99123456789"
  bradesco_shopfacil.bank_slip_issue_date = date('Y-m-d')
  bradesco_shopfacil.bank_slip_due_date = "2016-03-05"
  bradesco_shopfacil.bank_slip_value_title = 15000
  bradesco_shopfacil.bank_slip_url_logo = "http://via.placeholder.com/120x80"
  bradesco_shopfacil.bank_slip_header_message = "BRADESCO SHOPFACIL BOLETO BANCÁRIO"
  bradesco_shopfacil.bank_slip_rendering_type = '2'

  bradesco_shopfacil.bank_slip_instructions_line_1 = ""
  bradesco_shopfacil.bank_slip_instructions_line_2 = ""
  bradesco_shopfacil.bank_slip_instructions_line_3 = ""
  bradesco_shopfacil.bank_slip_instructions_line_4 = ""
  bradesco_shopfacil.bank_slip_instructions_line_5 = ""
  bradesco_shopfacil.bank_slip_instructions_line_6 = ""
  bradesco_shopfacil.bank_slip_instructions_line_7 = ""
  bradesco_shopfacil.bank_slip_instructions_line_8 = ""
  bradesco_shopfacil.bank_slip_instructions_line_9 = ""
  bradesco_shopfacil.bank_slip_instructions_line_10 = ""
  bradesco_shopfacil.bank_slip_instructions_line_11 = ""
  bradesco_shopfacil.bank_slip_instructions_line_12 = ""

  bradesco_shopfacil.token_request_confirmacao_pagamento = "99999999999"

  return_api = bradesco_shopfacil.data_service_request

end