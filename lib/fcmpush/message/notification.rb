# frozen_string_literal: true

module Fcmpush
  module Message
    class Notification
      include Validatable

      def validate!
        title = value[:title]
        body = value[:body]
        image = value[:image]

        [
          title.nil? || title.instance_of?(String) && !title.empty?,
          body.nil? || body.instance_of?(String)  && !body.empty?,
          image.nil? || image.instance_of?(String) && image.match?(URI.regexp),
        ].all?
      end
    end
  end
end
