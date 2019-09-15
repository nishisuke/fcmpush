# frozen_string_literal: true

module Fcmpush
  class Data < MessageValue
    def initialize(hash)
      @hash = hash
    end

    def valid?
      hash.nil? || hash.instance_of?(Hash) && hash.values.all? { |v| v.instance_of?(String) }
    end

    private

    attr_reader :hash
  end
end
