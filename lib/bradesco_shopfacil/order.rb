module BradescoShopfacil

  module Order

    attr_accessor :order_number, :order_value, :order_description

    def data_service_order
      order = {
          "numero" => order_number,
          "valor" => order_value,
          "descricao" => order_description
      }
      order
    end

  end

end