require 'squeeze_associations'

$LOAD_PATH.unshift ::File.dirname(__FILE__) + '/..'
Dir.glob('lib/spec_support/**/*.rb') do |file|
  require file.gsub('.rb', '')
end
require 'spec/blueprints'


Bundler.require

RSpec.configure do |config|
  config.before(:suite) { BluePrints.seed }
  #config.after(:suite)  {  }
end