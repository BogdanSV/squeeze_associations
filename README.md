# Squeeze Associations

Adds one method used to retrieve an array of full mongo documents or object ids 
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

```ruby
class YourClass
	include SqueezeAssociations::MongoMapper::RecursiveAssociations
end
# OR
class YourOtherClass
	plugin SqueezeAssociations::MongoMapper::RecursiveAssociations	
end
```

For making it globally available on all MongoMapper classes:

```ruby
	MongoMapper::Document.plugin(SqueezeAssociations::MongoMapper::RecursiveAssociations) 
end
```

Then you can easily call it as:

```ruby
YourClass.first.all_associated_documents
```	

This method has actually 2 optional parameters:

1. ignore_belongs_to, type:Boolean, default: true, purpose: whether to ignore or not belongsTo relationships when gathering data
2. only_ids, type:Boolean, default: false, purpose: whether to get full documents or ids only

## What it doesn't get
1. Embedded documents
2. To be determined ;)

## Be aware
This is not fully tested, so issues could occur for various scenarios!!

## TODO

Unit tests to be added 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
6. You're free to report any issues found; those would be really welcomed 

