module Webamm
  module Database
    module Schema
      class Column < Dry::Struct
        attribute :name, Types::String
        attribute :type, Types::String
        attribute :null, Types::Bool.optional
        attribute :default, Types::StrongString.optional
        attribute :values, Types::Array.default([].freeze)
      end
    end
  end
end
