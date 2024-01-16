# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lightcast::Client do
  subject { @client }

  before do
    @client = described_class.new(client_id: 'id', client_secret: 'secret', scope: 'scope')
  end

  describe '.initialize' do
    it 'returns a client object' do
      expect(@client).to be_a(described_class)
    end
  end

  describe '#connection_auth' do
    it 'returns a connection instance' do
      expect(@client.connection_auth).to be_a(Lightcast::Connection)
    end
  end

  describe '#connection_services' do
    it 'returns a connection instance' do
      expect(@client.connection_services).to be_a(Lightcast::Connection)
    end
  end

  describe '#skills' do
    it 'returns a skills client' do
      expect(@client.skills).to be_a(Lightcast::Services::Skills)
    end
  end
end
