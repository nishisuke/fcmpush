# frozen_string_literal: true

module Fcmpush
  class Message
    class Token < Value
      def valid?
        @token.instance_of?(String) || !@token.empty?
      end
    end
  end
end
