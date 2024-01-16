# frozen_string_literal: true

module Lightcast
  module Services
    class Skills
      def initialize(client:, version:)
        @client   = client
        @version  = version
      end

      def get(id)
        @client.connection_services.get("/skills/versions/#{@version}/skills/#{id}")
      end

      def extract(body = {}, query = { language: 'en', confidence_threshold: 0 })
        @client.connection_services.post(
          "/skills/versions/#{@version}/extract?language=#{query[:language]}&confidenceThreshold=#{query[:confidence_threshold]}", body
        )
      end

      def related(**params)
        @client.connection_services.post("/skills/versions/#{@version}/related", **params)
      end

      def status
        @client.connection_services.get('/skills/status')
      end
    end
  end
end
