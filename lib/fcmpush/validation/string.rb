# frozen_string_literal: true

module Fcmpush
  module Validation
    module String
      def validate(value)
        category.instance_of?(String) && super
      end
    end
  end
end
