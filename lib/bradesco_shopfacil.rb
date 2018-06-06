require_relative "bradesco_shopfacil/version"
require_relative "bradesco_shopfacil/buyer"
require_relative "bradesco_shopfacil/buyer_address"
require_relative "bradesco_shopfacil/bank_slip"
require_relative "bradesco_shopfacil/bank_slip_instructions"
require_relative "bradesco_shopfacil/order"

module BradescoShopfacil

  class Shopfacil

    include ::Order

    attr_accessor :media_type, :charset

    attr_accessor :sandbox

    @url_homologacao = 'https://homolog.meiosdepagamentobradesco.com.br'
    @url_producao = 'https://meiosdepagamentobradesco.com.br'

    def media_type
      @media_type ||= 'application/json'
    end

    def charset
      @charset ||= 'UTF-8'
    end

    def sandbox
      @sandbox ||= false
    end

    def initialize(merchant_id, security_key, email = false)
      @merchant_id = merchant_id
      @security_key = security_key
      @email = email
    end


    def data_service_request

      order = BradescoShopfacil::Order.new
      buyer = BradescoShopfacil::Buyer.new
      bank_slip = BradescoShopfacil::BankSlip.new

      service_request = {
          "merchant_id" => @merchant_id,
          "meio_pagamento" => "300",
          "pedido" => order.data_service_order,
          "comprador" => buyer.data_service_buyer,
          "boleto" => bank_slip.data_service_bank_slip,
          "token_request_confirmacao_pagamento" => 'token_request_confirmacao_pagamento'
      }
      service_request

      send_data('https://homolog.meiosdepagamentobradesco.com.br/apiboleto/transacao', service_request)
    end

    def send_data(params_url, params_data = nil)

      if sandbox
        url_bradesco = @url_homologacao
      else
        url_bradesco = @url_producao
      end

      url = "#{url_bradesco}#{params_url}"

      authorization_header = "#{@merchant_id}:#{@security_key}"
      authorization_header_base64 = Base64.encode64(authorization_header)

      pp headers = {
          accept: :json,
          :accept_charset => charset,
          :accept_encoding => media_type,
          content_type: :json,
          :Authorization => " Basic #{authorization_header_base64}"
      }
      pp params_data.to_json
      response = RestClient.post url, params_data.to_json, headers
pp response
      # //Configuracao do cabecalho da requisicao
      # $headers = array();
      # $headers[] = "Accept: " . $this->media_type;
      # $headers[] = "Accept-Charset: " . $this->charset;
      # $headers[] = "Accept-Encoding: " . $this->media_type;
      # $headers[] = "Content-Type: " . $this->media_type . ";charset=" . $this->charset;
      # if ($params_authorization_header_email) {
      #     $AuthorizationHeader = $this->email . ":" . $this->chave_seguranca;
      # } else {
      #     $AuthorizationHeader = $this->merchant_id . ":" . $this->chave_seguranca;
      # }
      # $AuthorizationHeaderBase64 = base64_encode($AuthorizationHeader);
      # $headers[] = "Authorization: Basic " . $AuthorizationHeaderBase64;
      # $ch = curl_init();
      # curl_setopt($ch, CURLOPT_URL, $url);
      # if ($params_data) {
      #     curl_setopt($ch, CURLOPT_POST, 1);
      # curl_setopt($ch, CURLOPT_POSTFIELDS, $params_data);
      # }
      # curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
      # curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
      # $result = curl_exec($ch);
      # return json_decode($result);

    end

  end

end

# t = BradescoShopfacil::Shopfacil.new('2342345', '34523452345')
#
# p t.url_homologacao