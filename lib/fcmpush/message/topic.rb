# frozen_string_literal: true

module Fcmpush
  module Message
    class Topic
      include Validatable

      def validate!
        value.instance_of?(String) && !value.empty? && value.start_with?('/topics/')
      end
    end
  end
end
