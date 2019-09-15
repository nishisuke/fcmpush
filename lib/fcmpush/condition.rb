# frozen_string_literal: true

module Fcmpush
  class Condition < MessageValue
    def initialize(condition)
      @condition = condition
    end

    def valid?
      condition.nil? || condition.instance_of?(String)
    end

    private

    attr_reader :condition
  end
end
