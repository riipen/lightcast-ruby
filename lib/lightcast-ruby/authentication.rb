# frozen_string_literal: true

module Lightcast
  module Authentication
    def authenticate # rubocop:disable Metrics/MethodLength
      response = connection_token.post('/connect/token',
                                       {
                                         client_id: @client_id,
                                         client_secret: @client_secret,
                                         grant_type: 'client_credentials'
                                       },
                                       {
                                         body: :form,
                                         content_type: 'application/x-www-form-urlencoded'
                                       })

      # Set the client values inline
      @access_token = response['access_token']

      # Give a chance to the invoker of the client to do something with the response
      response
    end
  end
end
