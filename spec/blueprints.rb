# encoding: utf-8
require 'mongo_mapper'
require 'machinist/mongo_mapper'
require 'sham'

RelatedApp.blueprint do
  name        { "app - #{sn}" }
  deployed_at { DateTime.now }
end

Change.blueprint do
  time     { DateTime.now }
  critical { true }
  related_apps(3)
end

User.blueprint do
  name     { "user-#{sn}" }
  changes(3)
  admin    { false }
  comments(3)
end

User.blueprint(:admin) do
  name  { "Admin User #{sn}" }
  admin { true }
end

Comment.blueprint do
  message { "something special #{sn}" }
end

module BluePrints
  def self.seed
    User.make
  end
end