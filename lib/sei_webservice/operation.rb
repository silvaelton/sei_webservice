module SeiWebservice
  class Operation < Connect
    attr_accessor :response, :response_format
    # => Parametros
    # :id_tipo_procedimento
    # :especificacao
    # :observacao
    # :nivel_acesso
    # :id_unidade

    def gerar_procedimento(args = {})      
      procedimento_params = {
        :id_tipo_procedimento => args[:id_tipo_procedimento] ||= nil,
        :especificacao => args[:especificacao] ||= nil,
        :assuntos => nil,
        :interessados => args[:interessado] ||= nil,
        :observacao => args[:observacao] ||= nil,
        :nivel_acesso => args[:nivel_acesso] ||= nil
      }
    
      params = {
        :sigla_sistema => @sigla,
        :identificacaoServico => @servico,
        :id_unidade => args[:id_unidade] ||= nil,
        :procedimento => procedimento_params,
        :documentos => nil,
        :procedimentos_relacionados => nil,
        :unidades_envio => nil,
        :sin_manter_aberto_unidade => 'S',
        :sin_enviar_email_notificacao => 'N',
        :data_retorno_programado => nil,
        :dias_retorno_programado => nil,
        :sin_dias_uteis_retorno_programado => nil,
      }
      
      @response = client.call(:gerar_procedimento, message: params)
      @response_format = SeiWebservice::Format.gerar_procedimento(@response.body)
    end

    # => Parametros
    # :tipo G(Gerado) || R (Externo)
    # :id_procedimento
    # :id_serie (Tipo do documento)
    # :numero (Arvore | Sub descricao)
    # :data
    # :remetente
    # :nome_arquivo
    # :conteudo
    # :conteudo_mtom
    # :nivel_acesso

    def incluir_documento(args = {})
      documento_params = {
        :tipo => args[:tipo] ||= nil,
        :id_procedimento => args[:id_procedimento] ||= nil,
        :id_serie => args[:id_serie] ||= nil,
        :numero => args[:numero] ||= nil,
        :data => args[:data] ||= nil,
        :descricao => args[:descricao] ||= nil,
        :remetente => args[:remetente] ||= nil,
        :interessados => nil,
        :destinatarios => nil,
        :observacao => args[:observacao] ||= nil,
        :nome_arquivo => args[:nome_arquivo] ||= nil,
        :conteudo => args[:conteudo] ||= nil,
        #ConteudoMTOM => args[:conteudo_mtom] ||= nil,
        :nivel_acesso => args[:nivel_acesso] ||= nil,
      }

      params = {
        :sigla_sistema => @sigla,
        :identificacaoServico => @servico,
        :id_unidade => args[:id_unidade] ||= nil,
        :documento => documento_params
      }

      @response = client.call(:incluir_documento, message: params)
      @response_format = SeiWebservice::Format.incluir_documento(@response.body)
    end
  end
end
