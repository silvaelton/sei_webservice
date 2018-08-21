module SeiWebservice
  class Service

    def self.generate_procedure(options = {}
      arguments = {
        SiglaSistema: Sei.configuration.acron,
        IdentificacaoServico: Sei.configuration.id,
        IdUnidade: unit_id,
        Procedimento: procedure.to_h
      }

      res = Sei::Connection.instance.call :gerar_procedimento, body: arguments 
      body = res.body[:gerar_procedimento_response][:parametros]
    end


    def self.add_document(unit_id, document)
    end

    def self.add_document_block(unit_id, block_id, document_protocol)
    end

    def self.add_process_block(unit_id, block_id, procedure_protocol)
    end

    def self.cancel_document(unit_id, document_protocol, reason)
    end

    def self.list_users(unit_id, user_id = nil)
    end

    def self.list_units(procedure_type_id = nil, serie_id = nil)
    end

    def self.consult_procedure(unit_id, procedure_protocol)
    end

    def self.consult_document(unit_id, document_protocol)
    end

  end
end
