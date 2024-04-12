# frozen_string_literal: true

require_relative 'services/skills'

module Lightcast
  class Client
    include Lightcast::Authentication

    BASE_URL_AUTH     = 'https://auth.emsicloud.com'
    BASE_URL_SERVICES = 'https://classification.emsicloud.com'

    def initialize(client_id:, client_secret:, scope:)
      @client_id      = client_id
      @client_secret  = client_secret
      @scope          = scope

      @skills = nil
    end

    def connection_auth
      Connection.new(url: BASE_URL_AUTH, scope: @scope)
    end

    def connection_services
      Connection.new(access_token: @access_token, url: BASE_URL_SERVICES)
    end

    def skills(version: '9.0.0', release: '2024.7')
      @skills ||= Lightcast::Services::Skills.new(client: self, version: version, release: release)
    end
  end
end
