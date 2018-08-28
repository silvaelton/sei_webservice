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
        IdTipoProcedimento: args[:id_tipo_procedimento] ||= nil,
        Especificacao: args[:especificacao] ||= nil,
        Assuntos: nil,
        Interessados: args[:interessado] ||= nil,
        Observacao: args[:observacao] ||= nil,
        NivelAcesso: args[:nivel_acesso] ||= nil
      }
    
      params = {
        SiglaSistema: @sigla,
        IdentificacaoServico: @servico,
        IdUnidade: args[:id_unidade] ||= nil,
        Procedimento: procedimento_params,
        Documentos: nil,
        ProcedimentosRelacionados: nil,
        UnidadesEnvio: nil,
        SinManterAbertoUnidade: 'S',
        SinEnviarEmailNotificacao: 'N',
        DataRetornoProgramado: nil,
        DiasRetornoProgramado: nil,
        SinDiasUteisRetornoProgramado: nil,
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
        Tipo: args[:tipo] ||= nil,
        IdProcedimento: args[:id_procedimento] ||= nil,
        IdSerie: args[:id_serie] ||= nil,
        Numero: args[:numero] ||= nil,
        Data: args[:data] ||= nil,
        Descricao: args[:descricao] ||= nil,
        Remetente: args[:remetente] ||= nil,
        Interessados: nil,
        Destinatarios: nil,
        Observacao: args[:observacao] ||= nil,
        NomeArquivo: args[:nome_arquivo] ||= nil,
        Conteudo: args[:conteudo] ||= nil,
        #ConteudoMTOM: args[:conteudo_mtom] ||= nil,
        NivelAcesso: args[:nivel_acesso] ||= nil,
      }

      params = {
        SiglaSistema: @sigla,
        IdentificacaoServico: @servico,
        IdUnidade: args[:id_unidade] ||= nil,
        Documento: documento_params
      }

      @response = client.call(:incluir_documento, message: params)
      @response_format = SeiWebservice::Format.incluir_documento(@response.body)
    end
  end
end