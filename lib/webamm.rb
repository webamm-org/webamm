require 'dry-struct'

module Types
  include Dry.Types()
  StrongString = String.constructor(->(val){ val.to_s })
end

require 'rest-client'
require 'json'
require 'fileutils'

require_relative 'webamm/cli/fetch_template'
require_relative 'webamm/cli/processor'

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

  class << self
    def build(files)
      dir_name = "webamm_app-#{Time.now.strftime('%Y%m%d%H%M%S')}"
      FileUtils.mkdir_p(dir_name)
      Dir.chdir(dir_name)

      files.each do |file|
        puts "-> \e[1;32;49mCreate\e[0m #{file['path']}"
        file_path = File.join(Dir.pwd, file['path'])
        FileUtils.mkdir_p(File.dirname(file_path))
        File.write(file_path, file['content'])
      end

      FileUtils.chmod_R("u+x", './bin')
    end
  end
end
