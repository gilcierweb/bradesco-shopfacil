module BradescoShopfacil

  module BuyerAddress

    attr_accessor :buyer_address_zip_code,
                  :buyer_address_patio,
                  :buyer_address_number,
                  :buyer_address_complement,
                  :buyer_address_neighborhood,
                  :buyer_address_city,
                  :buyer_address_state

    def data_service_buyer_address
      buyer_address = {
          "cep" => buyer_address_zip_code,
          "logradouro" => buyer_address_patio,
          "numero" => buyer_address_number,
          "complemento" => buyer_address_complement,
          "bairro" => buyer_address_neighborhood,
          "cidade" => buyer_address_city,
          "uf" => buyer_address_state
      }
      buyer_address
    end

  end
end