module BradescoShopfacil

  module BankSlipInstructions

    attr_accessor :bank_slip_instructions_line_1,
                  :bank_slip_instructions_line_2,
                  :bank_slip_instructions_line_3,
                  :bank_slip_instructions_line_4,
                  :bank_slip_instructions_line_5,
                  :bank_slip_instructions_line_6,
                  :bank_slip_instructions_line_7,
                  :bank_slip_instructions_line_8,
                  :bank_slip_instructions_line_9,
                  :bank_slip_instructions_line_10,
                  :bank_slip_instructions_line_11,
                  :bank_slip_instructions_line_12

    def data_service_bank_slip_instructions
      bank_slip_instructions = {
          "instrucao_linha_1" => bank_slip_instructions_line_1,
          "instrucao_linha_2" => bank_slip_instructions_line_2,
          "instrucao_linha_3" => bank_slip_instructions_line_3,
          "instrucao_linha_4" => bank_slip_instructions_line_4,
          "instrucao_linha_5" => bank_slip_instructions_line_5,
          "instrucao_linha_6" => bank_slip_instructions_line_6,
          "instrucao_linha_7" => bank_slip_instructions_line_7,
          "instrucao_linha_8" => bank_slip_instructions_line_8,
          "instrucao_linha_9" => bank_slip_instructions_line_9,
          "instrucao_linha_10" => bank_slip_instructions_line_10,
          "instrucao_linha_11" => bank_slip_instructions_line_11,
          "instrucao_linha_12" => bank_slip_instructions_line_12
      }
      bank_slip_instructions
    end

  end

end