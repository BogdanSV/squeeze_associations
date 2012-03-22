module SqueezeAssociations
  module MongoMapper
    module Associations
      BELONGS_TO   = EXTENDED_MM_PATH::BelongsToAssociation
      HAS_MANY     = EXTENDED_MM_PATH::ManyAssociation
      HAS_ONE      = EXTENDED_MM_PATH::OneAssociation
      EMBEDDED     = EXTENDED_MM_PATH::ManyEmbeddedProxy
      POL_EMBEDDED = EXTENDED_MM_PATH::ManyEmbeddedPolymorphicProxy

      private
      EXTENDED_MM_PATH = MongoMapper::Plugins::Associations
    end
  end
end