require 'squeeze_associations/version'
require 'squeeze_associations/mongo_mapper/recursive_associations'

module SqueezeAssociations
  autoload :Constants, 'squeeze_associations/mongo_mapper/constants/mm_associations'
  autoload :RecursiveDocuments, 'squeeze_associations/mongo_mapper/recursive_associations'
end