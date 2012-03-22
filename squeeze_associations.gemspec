# -*- encoding: utf-8 -*-
require File.expand_path('../lib/squeeze_associations/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Bogdan Barla"]
  gem.email         = ["bogdan.barla@softvisioninc.eu"]
  gem.description   = %q{Gets all documents/ids associated with one document}
  gem.summary       = %q{Adds one method used to retrieve an array of whole mongo documents or object ids 
                          of the associated documents giving an initial ODM object}
  gem.homepage      = ""

  gem.rubyforge_project = 'squeeze_associations'

  # DEPENDENCIES
  gem.add_dependency 'mongo_mapper', "0.11.0"
  gem.add_development_dependency "rspec", "2.9.0"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "squeeze_associations"
  gem.require_paths = ["lib"]
  gem.version       = SqueezeAssociations::VERSION
end