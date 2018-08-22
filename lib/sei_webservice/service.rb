module SeiWebservice
  class Service < Operation
    
    def initialize
      @sigla    = SeiWebservice.configuration.sigla
      @servico  = SeiWebservice.configuration.servico
    end

  end
end
