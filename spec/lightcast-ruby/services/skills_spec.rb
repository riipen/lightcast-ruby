# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lightcast::Services::Skills do
  subject { @skills }

  before do
    @client = Lightcast::Client.new(client_id: 'id', client_secret: 'secret', scope: 'scope')
    @release = '2024.7'
    @version = '9.0.0'
    @skills = described_class.new(client: @client, version: @version, release: @release)
  end

  describe '.initialize' do
    it 'returns a skills object' do
      expect(@skills).to be_a(described_class)
    end
  end

  describe '#extract' do
    it 'issues the correct POST request' do
      params = {
        body: {
          text: 'blah blah',
          inputLocale: 'en-US',
          outputLocale: 'en-US',
          confidenceThreshold: 0.5
        }
      }

      stub = stub_request(:post, "#{Lightcast::Client::BASE_URL_SERVICES}/classifications/#{@release}/skills/extract")
             .with(**params)

      @skills.extract(**params[:body])

      expect(stub).to have_been_requested
    end
  end

  describe '#get' do
    it 'issues the correct GET request' do
      id    = '1'
      stub  = stub_request(:get, "#{Lightcast::Client::BASE_URL_SERVICES}/taxonomies/skills/versions/#{@version}/concepts/#{id}")

      @skills.get(id)

      expect(stub).to have_been_requested
    end
  end

  describe '#list' do
    it 'issues the correct POST request' do
      params = {
        body: {
          fields: ['name'],
          filter: { level: '2' }
        }
      }

      stub = stub_request(:post, "#{Lightcast::Client::BASE_URL_SERVICES}/taxonomies/skills/versions/#{@version}/concepts")
             .with(**params)

      @skills.list(**params[:body])

      expect(stub).to have_been_requested
    end
  end

  describe '#related' do
    it 'issues the correct POST request' do
      params = {
        body: {
          ids: ['4008b9b1-1251-40a3-ba90-1bbc9720fc37'],
          relationType: 'sibling'
        }
      }

      stub = stub_request(:post, "#{Lightcast::Client::BASE_URL_SERVICES}/taxonomies/skills/versions/#{@version}/relations")
             .with(**params)

      @skills.related(**params[:body])

      expect(stub).to have_been_requested
    end
  end

  describe '#status' do
    it 'issues the correct GET request' do
      stub = stub_request(:get, "#{Lightcast::Client::BASE_URL_SERVICES}/status")

      @skills.status

      expect(stub).to have_been_requested
    end
  end
end
