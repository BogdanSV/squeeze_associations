source 'https://rubygems.org'

# Specify your gem's dependencies in squeeze_associations.gemspec
gemspec

gem "bson_ext", '1.6.1'

group :development, :test do
  gem "mongoid", '2.4.7'
end

group :test do
  #gem 'factory_girl', '2.6.4'
  #gem 'machinist', '2.0'
  gem 'machinist', '~> 1.0.6'
  gem "machinist_mongo", "1.2.0", :git => 'git://github.com/plusplus/machinist_mongo.git', :require => 'machinist/mongo_mapper'#, :branch => 'machinist2'
  #">=2.0.0.beta.1", :git => 'git://github.com/nmerouze/machinist_mongo.git'
  #gem "machinist_mongo", "1.2.0", :require => 'machinist/mongo_mapper'
  gem 'sham', '1.0.3'
end
