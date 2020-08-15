# frozen_string_literal: true

module Fcmpush
  module Validation
    module StringUri
      def validate(value)
        value.instance_of?(String) && value.match?(URI.regexp) && super
      end
    end
  end
end
