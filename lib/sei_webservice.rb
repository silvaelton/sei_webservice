require 'gem_config'
require 'savon'
require 'open-uri'
require 'prawn'

require 'sei_webservice/connect'
require 'sei_webservice/operation'
require 'sei_webservice/service'
require 'sei_webservice/format'
require 'sei_webservice/file'
require 'sei_webservice/version'

module SeiWebservice
  include GemConfig::Base

  with_configuration do 
    has :wsdl, classes: String
    has :follow_redirects
    has :pretty_print_xml
    has :sigla, classes: String
    has :servico, classes: String
  end
end
