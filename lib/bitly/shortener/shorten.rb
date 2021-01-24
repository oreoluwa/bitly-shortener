require 'net/https'
require 'uri'
require 'json'

module Bitly::Shortener
  class Shorten
    class InvalidRequestException < StandardError; end
    BITLY_API_URL = URI('https://api-ssl.bitly.com/v4/shorten'.freeze)
    BITLY_API_KEY = ENV['BITLY_API_KEY'].to_s.freeze

    def self.client
      return @client if defined? @client

      @client = Net::HTTP.new(BITLY_API_URL.host, BITLY_API_URL.port)
      @client.use_ssl = true
      @client.verify_mode = OpenSSL::SSL::VERIFY_NONE

      @client
    end

    attr_reader :req

    def initialize(req)
      @req = req
    end

    def shortened_url
      request = build_request
      request.body = {
        long_url: req.url,
        domain: 'bit.ly'
      }.to_json

      response = self.class.client.request(request)
      raise(InvalidRequestException, response.body, caller) unless response.is_a?(Net::HTTPSuccess)

      body = JSON.parse(response.body)
      body['link']
    end

    private

    def build_request
      request = Net::HTTP::Post.new(BITLY_API_URL)
      request['Authorization'] = "Bearer #{BITLY_API_KEY}"
      request['Content-Type'] = 'application/json'

      request
    end
  end
end
