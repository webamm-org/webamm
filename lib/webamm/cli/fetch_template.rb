# frozen_string_literal: true

module Webamm
  module Cli
    class FetchTemplate
      API_HOST = 'https://app.webamm.org'

      def call(uid)
        api_url = ENV.fetch('API_HOST', API_HOST)
        response = RestClient.get(api_url + "/api/v1/plans/#{uid}") { |res| res }

        return if response.code != 200

        JSON.parse(response.body)
      end
    end
  end
end
