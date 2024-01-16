# frozen_string_literal: true

require_relative 'services/skills'

module Lightcast
  class Client
    include Lightcast::Authentication

    BASE_URL_SERVICE  = 'https://emsiservices.com'
    BASE_URL_TOKEN    = 'https://auth.emsicloud.com'

    def initialize(client_id:, client_secret:, scope:)
      @client_id      = client_id
      @client_secret  = client_secret
      @scope          = scope

      @skills = nil
    end

    def connection_services
      Connection.new(access_token: @access_token, url: BASE_URL_SERVICE)
    end

    def connection_token
      Connection.new(url: BASE_URL_TOKEN)
    end

    def skills(version: 'latest')
      @skills ||= Lightcast::Services::Skills.new(client: self, version: version)
    end
  end
end
