# Bradesco ShopFácil

[![Build Status](https://travis-ci.org/gilcierweb/bradesco-shopfacil.svg?branch=master)](https://travis-ci.org/gilcierweb/bradesco-shopfacil)
[![Maintainability](https://api.codeclimate.com/v1/badges/16d438fe3991af274cba/maintainability)](https://codeclimate.com/github/gilcierweb/bradesco-shopfacil/maintainability)
[![Gem Version](https://badge.fury.io/rb/bradesco_shopfacil.svg)](https://badge.fury.io/rb/bradesco_shopfacil)

MEIOS DE PAGAMENTO BRADESCO BOLETO BANCÁRIO

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bradesco_shopfacil'

# or
gem 'bradesco_shopfacil', :git => 'https://github.com/gilcierweb/bradesco-shopfacil'

```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bradesco_shopfacil

### Doação / Donate
Doar com PagSeguro
https://pag.ae/bmgSGGm

[![](https://raw.github.com/gilcierweb/shopfacil/master/examples/image/clique-para-doar-qualquer-quantia.jpg)](https://pag.ae/bmgSGGm)

### Consultoria / consulting

http://gilcierweb.com.br

## Usage

### Exemplo / Example

```ruby

  merchant_id = "90000"
  security_key = "SUA CHAVE"

  bradesco_shopfacil = BradescoShopfacil::Shopfacil.new(merchant_id, security_key)

  bradesco_shopfacil.sandbox = true

  bradesco_shopfacil.order_value = 15000
  bradesco_shopfacil.order_number = "GilcierWeb_#{Time.now.strftime("%Y-%m-%d%H%M%S")}"
  bradesco_shopfacil.order_description = 'Descritivo do pedido'

  bradesco_shopfacil.buyer_name = "Nome do comprador/Pagador"
  bradesco_shopfacil.buyer_document = "38604763007"
  bradesco_shopfacil.buyer_http_user_agent = request.user_agent # optional

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
  bradesco_shopfacil.bank_slip_issue_date = Date.today
  bradesco_shopfacil.bank_slip_due_date = "2018-06-30"
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

  bradesco_shopfacil.token_request_confirmation_payment = "99999999999"

  return_api = bradesco_shopfacil.data_service_request

  return_api
```

### Example of Request (JSON)

```json
{
  "merchant_id": "90000",
  "meio_pagamento": "300",
  "pedido": {
    "numero": "0-9_A-Z_.MAX-27-CH99",
    "valor": 15000,
    "descricao": "Descritivo do pedido"
  },
  "comprador": {
    "nome": "Nome do comprador/sacado",
    "documento": "38604763007",
    "endereco": {
      "cep": "02010700",
      "logradouro": "Rua Domingos Sergio dos Anjos",
      "numero": "277",
      "complemento": "",
      "bairro": "Jardim Santo Elias",
      "cidade": "Sao Paulo",
      "uf": "SP"
    },
    "ip": "IP do comprador",
    "user_agent": "User agent/browser do comprador"
  },
  "boleto": {
    "beneficiario": "Scopus",
    "carteira": "25",
    "nosso_numero": "99123456789",
    "data_emissao": "2016-03-01",
    "data_vencimento": "2016-03-05",
    "valor_titulo": 15000,
    "url_logotipo": "http://via.placeholder.com/120x80",
    "mensagem_cabecalho": "mensagem de cabecalho",
    "tipo_renderizacao": "2",
    "instrucoes": {
      "instrucao_linha_1": "instrucao 01",
      "instrucao_linha_2": "instrucao 02",
      "instrucao_linha_3": "instrucao 03"
    },
    "registro": {
      "agencia_pagador": "00014",
      "razao_conta_pagador": "07050",
      "conta_pagador": "12345679",
      "controle_participante": "Segurança arquivo remessa",
      "aplicar_multa": true,
      "valor_percentual_multa": 1000,
      "valor_desconto_bonificacao": 1200,
      "debito_automatico": false,
      "rateio_credito": false,
      "endereco_debito_automatico": "1",
      "tipo_ocorrencia": "02",
      "especie_titulo": "01",
      "primeira_instrucao": "00",
      "segunda_instrucao": "00",
      "valor_juros_mora": 1000,
      "data_limite_concessao_desconto": "2016-03-07",
      "valor_desconto": 200,
      "valor_iof": 0,
      "valor_abatimento": 0,
      "tipo_inscricao_pagador": "01",
      "sequencia_registro": "00001"
    }
  },
  "token_request_confirmacao_pagamento": "21323dsd23434ad12178DDasY"
}
```

### Example of Response (JSON)

```json
{
  "merchant_id": "90000",
  "meio_pagamento": "800",
  "pedido": {
    "numero": "0-9_A-Z_.MAX-27-CH99",
    "valor": 15000,
    "descricao": "Descritivo do pedido"
  },
  "boleto": {
    "valor_titulo": 15000,
    "data_geracao": "2016-04-22T08:10:43",
    "data_atualizacao": null,
    "linha_digitavel": "23790000255123456789223000000002867240000015000",
    "linha_digitavel_formatada": "23790.00025 51234.567892 23000.000002 8 67240000015000",
    "token":"c3ZtRGVKRDFoUlRESmxRNnhKQnpJalFrb0VueXdVdUxnT2FVMG45cm1qMFMyRDcwRWZ0cFVBS0o0\nMFAxOHY0aTdJK3E1MXVjUVJjNEpBdUxvcE15T1E9PQ==",
    "url_acesso":    "http://localhost:9080/boleto/titulo?token=c3ZtRGVKRDFoUlRESmxRNnhKQnpJalFrb0VueXdVdUxnT2FVMG45cm1qMFMyRDcwRWZ0cFVBS0o0\nMFAxOHY0aTdJK3E1MXVjUVJjNEpBdUxvcE15T1E9PQ=="
  },
  "status": {
    "codigo": 0,
    "mensagem": "OPERACAO REALIZADA COM SUCESSO",
    "detalhes": null
  }
}
```
### URL Manual

https://homolog.meiosdepagamentobradesco.com.br/manual/Manual_BoletoBancario.pdf

### URL Manual Consultas de Pedidos

https://homolog.meiosdepagamentobradesco.com.br/manual/Manual_ConsultaPedidos.pdf

### Site

http://gilcierweb.com.br

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/bradesco-shopfacil. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BradescoShopfacil project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/bradesco_shopfacil/blob/master/CODE_OF_CONDUCT.md).

