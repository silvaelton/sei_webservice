module SeiWebservice
  class Format
    def self.gerar_procedimento(body)
      
      if body.has_key?(:gerar_procedimento_response)
        body[:gerar_procedimento_response][:parametros]
      else
        nil
      end
    end
    
    def self.incluir_documento(body)
      
      if body.has_key?(:incluir_documento_response)
        body[:incluir_documento_response][:parametros]
      else
        nil
      end
    end
  end
end