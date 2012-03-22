require "lib/squeeze_associations/mongo_mapper/constants/constans"

module SqueezeAssociations
  module MongoMapper
    module RecursiveAssociations
      extend ActiveSupport::Concern

      CONSTANTS = Sa::MongoMapper::Associations

      module ClassMethods
      end

      module InstanceMethods
        #TODO - error handling
        # This method is intended to get most of the documents that relates (in MongoMapper) having an input doc as starting / root point
        # It excludes embedded documents and avoids cycling through the same relations
        # It is also subject to improve
        # Input
        # => 2 optional parameters:
        # =>  ignore_belongs_to - if true (default), doesn't try to get documents by following belongs_to relations
        # =>                    - if false, it also get through the belongs_to relations which might take longer
        # =>  only_ids - if true, not whole documents are returned, but only document ids
        # =>           - if false (default), it gets whole documents
        # Response sample: provided in config.examples.txt
        def all_associated_documents(ignore_belongs_to=true, only_ids=false)
          [].tap do |assoc|
            @@tree_models = [] unless defined?(@@tree_models)
            @@tree_models << self.class.name
            @@tree_models.uniq!
            associations.values.each do |as|
              assoc_class_name = as.class_name
              next if skip_model?(as ,ignore_belongs_to)
              docs = get_proxy(as).send(:load_target)
              Array.wrap(docs).each do |doc|
                if existing_hash = assoc.detect{|a| a.keys.first == assoc_class_name }
                  new_value = only_ids ? doc.id : doc
                  existing_hash[assoc_class_name].push(new_value)
                  assoc.map!{ |e| e.keys.first == assoc_class_name ? existing_hash : e }.flatten!
                else
                  new_value = only_ids ? doc.id : doc
                  assoc.push(Hash[assoc_class_name => [new_value]])
                end
                assoc.concat(doc.send(:all_associated_documents, ignore_belongs_to, only_ids)) if doc.respond_to?(:all_associated_documents)
              end
            end
          end
        end
        
        private
        # Used to check whether an association should be skipped or not based on it's type and 
        def skip_model?(association, ignore_belongs_to)
          assoc_name = association.class_name
            if [CONSTANTS::EMBEDDED, CONSTANTS::POL_EMBEDDED].include?(association.proxy_class)
              return true
            elsif association.kind_of?(CONSTANTS::BELONGS_TO)
              return true if @@tree_models.include?(assoc_name) || ignore_belongs_to
            end
          false
        end
  
      end
    end
  end
end