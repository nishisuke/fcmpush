# frozen_string_literal: true

module Fcmpush
  class Message
    class Topic < Value
      def valid?
        (@topic.instance_of?(String) || @topic.instance_of?(Symbol)) &&
          !@topic.empty? &&
          !@topic.to_s.start_with?('/topics/')
      end
    end
  end
end
