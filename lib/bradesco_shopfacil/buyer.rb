require 'socket'
require_relative 'buyer_address'

module BradescoShopfacil

  class Buyer

    attr_accessor :buyer_name, :buyer_document

    def data_service_buyer
      buyer_address = BradescoShopfacil::BuyerAddress.new
      buyer = {
          "nome" => buyer_name,
          "documento" => buyer_document,
          "endereco" => buyer_address.data_service_buyer_address,
          "ip" => get_ip,
          "user_agent" => http_user_agent
      }
      buyer
    end

    private

    def get_ip
      ip_address = Socket.ip_address_list
      ip_address[0]
    end

    def http_user_agent
      ENV['HTTP_USER_AGENT']
    end

  end

end

# t = BradescoShopfacil::Buyer.new
#
# pp t.data_service_buyer
