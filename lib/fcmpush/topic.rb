# frozen_string_literal: true

module Fcmpush
  class Topic < MessageValue
    def initialize(topic)
      @topic = topic
    end

    def valid?
      topic.nil? || topic.instance_of?(String) && !topic.start_with?(/topics/)
    end

    private

    attr_reader :token
  end
end
