require 'sei_webservice/version'
require 'gem_config'

module SeiWebservice
  include GemConfig::Base

  with_configuration do 
    has :wsdl, classes: String
    has :follow_redirects
    has :pretty_print_xml
    has :acron, classes: String
    has :id, classes: String
  end
end
