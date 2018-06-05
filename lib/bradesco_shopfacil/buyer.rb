module BradescoShopfacil

  class Buyer

    attr_accessor :buyer_name, :buyer_document


    buyer_ip = nil
    buyer_user_agent = nil

    def dataServiceComprador()

      data_service_comprador = {
          "nome" => buyer_name,
          "documento" => buyer_document,
          "endereco" => dataServiceCompradorEndereco(),
          "ip" => $_SERVER["REMOTE_ADDR"],
          "user_agent" => $_SERVER["HTTP_USER_AGENT"]
      }
      data_service_comprador
    end
  end

end