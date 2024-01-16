# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lightcast::Services::Skills do
  subject { @skills }

  before do
    @client = Lightcast::Client.new(client_id: 'id', client_secret: 'secret', scope: 'scope')
    @skills = described_class.new(client: @client, version: 'latest')
  end

  describe '.initialize' do
    it 'returns a skills object' do
      expect(@skills).to be_a(described_class)
    end
  end

  describe '#extract' do
    it 'issues the correct POST request' do
      query = {
        language: 'fr',
        confidence_threshold: 0.5
      }
      params = {
        text: 'blah blah'
      }

      stub = stub_request(:post, "#{Lightcast::Client::BASE_URL_SERVICES}/skills/versions/latest/extract")
             .with(query: { language: query[:language], confidenceThreshold: query[:confidence_threshold] })
             .with(body: params)

      @skills.extract(params, query)

      expect(stub).to have_been_requested
    end
  end

  describe '#get' do
    it 'issues the correct GET request' do
      id    = '1'
      stub  = stub_request(:get, "#{Lightcast::Client::BASE_URL_SERVICES}/skills/versions/latest/skills/#{id}")

      @skills.get(id)

      expect(stub).to have_been_requested
    end
  end

  describe '#related' do
    it 'issues the correct POST request' do
      params = {
        ids: ['4008b9b1-1251-40a3-ba90-1bbc9720fc37']
      }

      stub = stub_request(:post, "#{Lightcast::Client::BASE_URL_SERVICES}/skills/versions/latest/related")
             .with(body: params)

      @skills.related(**params)

      expect(stub).to have_been_requested
    end
  end

  describe '#status' do
    it 'issues the correct GET request' do
      stub = stub_request(:get, "#{Lightcast::Client::BASE_URL_SERVICES}/skills/status")

      @skills.status

      expect(stub).to have_been_requested
    end
  end
end
