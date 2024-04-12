# frozen_string_literal: true

module Lightcast
  module Services
    class Skills
      def initialize(client:, version:, release:)
        @client   = client
        @version  = version
        @release = release
      end

      def extract(**params)
        @client.connection_services.post(
          "/classifications/#{@release}/skills/extract", **params
        )
      end

      def get(id)
        @client.connection_services.get("/taxonomies/skills/versions/#{@version}/concepts/#{id}")
      end

      def list(**params)
        @client.connection_services.post("/taxonomies/skills/versions/#{@version}/concepts", **params)
      end

      def related(**params)
        @client.connection_services.post("/taxonomies/skills/versions/#{@version}/relations", **params)
      end

      def status
        @client.connection_services.get('/status')
      end
    end
  end
end
