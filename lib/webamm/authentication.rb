module Webamm
  class Authentication < Dry::Struct
    attribute :table, Types::String
    attribute :features, Types::Array.of(Types::String).default([].freeze)
  end
end
