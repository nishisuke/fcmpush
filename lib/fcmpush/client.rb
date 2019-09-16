# frozen_string_literal: true

module Fcmpush
  class Client
    # TODO: project id
    URL = 'https://fcm.googleapis.com/v1/projects/virtually-650f2/messages:send'

    def initialize(authorization:, http_driver: ::Faraday)
      @http_driver = http_driver
      @authorization = authorization
    end

    def send(message)
      http_driver.post(URL, message.to_json, headers)
    end

    private

    attr_reader :http_driver, :authorization

    def headers
      {
        content_type: 'application/json',
        authorization: authorization,
      }
    end
  end
end
