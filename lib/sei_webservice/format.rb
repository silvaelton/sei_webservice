module SeiWebservice
  class Format
    def self.gerar_procedimento(body)
      body[:gerar_procedimento_response][:parametros]
    end
  end
end