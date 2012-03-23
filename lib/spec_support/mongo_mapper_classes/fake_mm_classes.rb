# FAKE CLASSES FOR BLUEPRINTS
require 'mongo_mapper'

class RelatedApp
  include MongoMapper::Document

  key :name,        String
  key :deployed_at, DateTime
end

class Change
  include MongoMapper::Document

  key :time,     DateTime
  key :critical, Boolean

  many :related_apps
end

class User
  include MongoMapper::Document

  key :name,  String
  key :admin, Boolean
  
  many :changes
  many :comments
end

class Comment
  include MongoMapper::Document

  key :message, String
  many :reply_comments
end

class ReplyComment
  include MongoMapper::EmbeddedDocument

  key :message, String
  belongs_to :user
end
