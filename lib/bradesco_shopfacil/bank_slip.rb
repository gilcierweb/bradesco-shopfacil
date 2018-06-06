require_relative 'bank_slip_instructions'

module BradescoShopfacil

  module BankSlip

    include BankSlipInstructions

    attr_accessor :bank_slip_beneficiary,
                  :bank_slip_wallet,
                  :bank_slip_our_number,
                  :bank_slip_issue_date,
                  :bank_slip_due_date,
                  :bank_slip_value_title,
                  :bank_slip_url_logo,
                  :bank_slip_header_message,
                  :bank_slip_rendering_type,
                  :data_service_bank_slip_register

    def data_service_bank_slip
      bank_slip = {
          "beneficiario" => bank_slip_beneficiary,
          "carteira" => bank_slip_wallet,
          "nosso_numero" => bank_slip_our_number,
          "data_emissao" => bank_slip_issue_date,
          "data_vencimento" => bank_slip_due_date,
          "valor_titulo" => bank_slip_value_title,
          "url_logotipo" => bank_slip_url_logo,
          "mensagem_cabecalho" => bank_slip_header_message,
          "tipo_renderizacao" => bank_slip_rendering_type,
          "instrucoes" => data_service_bank_slip_instructions,
          "registro" => data_service_bank_slip_register
      }
      bank_slip
    end

  end

end