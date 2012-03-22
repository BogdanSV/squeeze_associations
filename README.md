# Squeeze Associations

Adds one method used to retrieve an array of whole mongo documents or object ids 
                          of the associated documents giving an initial ODM object

## Installation

Add this line to your application's Gemfile:

    gem 'squeeze_associations'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install squeeze_associations

## Usage
NB! It only works with MongoMappers for now; will try to adapt it for Mongoid and maybe ActiveRecord in the future versions.

	require 'squeeze_associations'

For making the *all_associated_documents* method available to one single class instances:

	class YourClass
	  include SqueezeAssociations::MongoMapper::RecursiveAssociations
	end
	OR
	class YourOtherClass
	  plugin SqueezeAssociations::MongoMapper::RecursiveAssociations	
	end

For making it globally available on all MongoMapper classes:

	MongoMapper::Document.plugin(SqueezeAssociations::MongoMapper::RecursiveAssociations) 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
