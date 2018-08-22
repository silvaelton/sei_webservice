
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sei_webservice/version"

Gem::Specification.new do |spec|
  spec.name          = "sei_webservice"
  spec.version       = SeiWebservice::VERSION
  spec.authors       = ["Elton Silva"]
  spec.email         = ["elton.chrls@gmail.com"]

  spec.summary       = %q{Gem para integração com Webservice SEI}
  spec.homepage      = "https://github.com/silvaelton/sei_webservice"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  
  spec.add_runtime_dependency "gem_config", "~> 0.3.1"
  spec.add_runtime_dependency "savon", "~> 2.12.0"
  spec.add_runtime_dependency "prawn", "~> 2.2.2"

end
