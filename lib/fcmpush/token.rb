# frozen_string_literal: true

module Fcmpush
  class Token < MessageValue
    def initialize(token)
      @token = token
    end

    def valid?
      token.nil? || token.instance_of?(String)
    end

    private

    attr_reader :token
  end
end
