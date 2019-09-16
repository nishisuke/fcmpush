# frozen_string_literal: true

module Fcmpush
  module ValidatableObject
    def initialize(value)
      @value = value
    end

    def validate!
      raise NotImplementedError
    end

    private

    attr_reader :value
  end
end
