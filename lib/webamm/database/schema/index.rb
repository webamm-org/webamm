module Webamm
  module Database
    module Schema
      class Index < Dry::Struct
        attribute :name, Types::String
        attribute :columns, Types::Array
        attribute :unique, Types::Bool.default(false)
      end
    end
  end
end
