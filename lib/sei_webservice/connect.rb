module SeiWebservice
  class Connect
    def client
      options = {
        wsdl: SeiWebservice.configuration.wsdl,
        follow_redirects: Sei.configuration.follow_redirects,
        pretty_print_xml: Sei.configuration.pretty_print_xml,
        convert_request_keys_to: :camelcase
      }

      @client ||= Savon.client(options)
    end
    
    def call(service, message)
      request = client.build_request service, message: message
      SeiWebservice::Parser.to_xml(request.body)
      client.call service, message
    end
  end
end