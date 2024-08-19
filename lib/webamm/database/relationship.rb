module Webamm
  module Database
    class Relationship < Dry::Struct
      attribute :type, Types::String
      attribute :source, Types::String
      attribute? :destination, Types::String.optional
      attribute :required, Types::Bool.optional
      attribute? :options do
        attribute? :habtm, Types::Bool.optional
        attribute? :habtm_table, Types::String.optional
        attribute? :habtm_tables, Types::Array.optional
        attribute? :class_name, Types::String.optional
        attribute? :foreign_key, Types::String.optional
        attribute? :dependent, Types::String.optional
        attribute? :through, Types::String.optional
      end
    end
  end
end
