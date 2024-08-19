module Webamm
  module Database
    class Crud < Dry::Struct
      attribute :table, Types::String
      attribute :actions, Types::Array.default([].freeze) do
        attribute :name, Types::String
        attribute :options do
          attribute :authentication, Types::Array.default([].freeze)
          attribute :model_attributes, Types::Array.default([].freeze)
        end
      end
    end
  end
end
