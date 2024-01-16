# frozen_string_literal: true

module Lightcast
  class Client
    BASE_URL_SERVICE  = "https://emsiservices.com"
    BASE_URL_TOKEN    = "https://auth.emsicloud.com"

    def initialize(client_id:, client_secret:, scope:, )
      @client_id      = client_id
      @client_secret  = client_secret
      @scope          = scope
    end

    def connection
      Connection.new(access_token: @access_token, url: base_url)
    end

    def connection_token
      Connection.new(url: token_url)
    end
  end
end