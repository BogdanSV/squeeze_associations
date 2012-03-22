require 'mongo_mapper'

module SqueezeAssociations
  module MongoMapper
    module AssociationsConstants
      include ActiveSupport::Inflector

      EXTENDED_MM_PATH = 'MongoMapper::Plugins::Associations'

      BELONGS_TO   = "#{EXTENDED_MM_PATH}::BelongsToAssociation".constantize
      HAS_MANY     = "#{EXTENDED_MM_PATH}::ManyAssociation".constantize
      HAS_ONE      = "#{EXTENDED_MM_PATH}::OneAssociation".constantize
      EMBEDDED     = "#{EXTENDED_MM_PATH}::ManyEmbeddedProxy".constantize
      POL_EMBEDDED = "#{EXTENDED_MM_PATH}::ManyEmbeddedPolymorphicProxy".constantize

    end
  end
end