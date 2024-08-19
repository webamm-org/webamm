require 'dry-struct'

module Types
  include Dry.Types()
  StrongString = String.constructor(->(val){ val.to_s })
end

require_relative 'webamm/database/schema/column'
require_relative 'webamm/database/schema/index'
require_relative 'webamm/authentication'
require_relative 'webamm/database/crud'
require_relative 'webamm/database/relationship'

module Webamm
  class Definition < Dry::Struct
    attribute :authentication, Types::Array.of(Webamm::Authentication).default([].freeze)
    attribute :database do
      attribute :engine, Types::String
      attribute :crud, Types::Array.of(Webamm::Database::Crud).default([].freeze)
      attribute :schema, Types::Array.default([].freeze) do
        attribute :table, Types::String
        attribute :columns, Types::Array.of(Webamm::Database::Schema::Column).default([].freeze)
        attribute :indices, Types::Array.of(Webamm::Database::Schema::Index).default([].freeze)
        attribute? :options do
          attribute? :habtm, Types::Bool.optional
          attribute? :habtm_tables, Types::Array.optional
          attribute? :use_uuid, Types::Bool.optional
        end
      end
      attribute :relationships, Types::Array.of(Webamm::Database::Relationship).default([].freeze)
    end
  end
end
