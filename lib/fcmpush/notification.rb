# frozen_string_literal: true

module Fcmpush
  class Notification < MessageValue
    def initialize(title:, body:, image:)
      @title = title
      @body = body
      @image = image
    end

    def valid?
      [
        title.nil? || title.instance_of?(String)
        body.nil? || body.instance_of?(String)
        image.nil? || image.instance_of?(String) && image.match?(URI.regexp)
      ].all?
    end

    private

    attr_reader *%i[title body image]
  end
end
