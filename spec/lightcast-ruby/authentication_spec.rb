# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lightcast::Authentication do
  subject { @client }

  before do
    @client = Lightcast::Client.new(client_id: 'id', client_secret: 'secret', scope: 'scope')
  end

  # Instance Methods
  describe '#authenticate' do
    it 'issues the correct request' do
      stub = stub_request(:post, "#{Lightcast::Client::BASE_URL_AUTH}/connect/token")
             .with(body: 'client_id=id&client_secret=secret&grant_type=client_credentials')

      @client.authenticate

      expect(stub).to have_been_requested
    end
  end
end
