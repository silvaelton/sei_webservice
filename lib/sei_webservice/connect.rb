
module SeiWebservice
  class Connect

    def client
      options = {
        wsdl: SeiWebservice.configuration.wsdl,
        follow_redirects: SeiWebservice.configuration.follow_redirects,
        pretty_print_xml: SeiWebservice.configuration.pretty_print_xml,
        convert_request_keys_to: :camelcase
      }

      @client ||= Savon.client(options)
    end

  end
end