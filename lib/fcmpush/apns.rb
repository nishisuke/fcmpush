# frozen_string_literal: true

module Fcmpush
  class Apns < MessageValue
    class Payload < MessageValue
      class Alert < MessageValue
        def initialize(title:, subtitle:, body:, launch_image:, title_loc_key:, title_loc_args:, subtitle_loc_key:, subtitle_loc_args:, loc_key:, loc_args)
          @title = title
          @subtitle = subtitle
          @body = body
          @launch_image = launch_image
          @title_loc_key = title_loc_key
          @title_loc_args = title_loc_args
          @subtitle_loc_key = subtitle_loc_key
          @subtitle_loc_args = subtitle_loc_args
          @loc_key = loc_key
          @loc_args = loc_args
        end

        def valid?
          [
            title.nil? || title.instance_of?(String),
            subtitle.nil? || subtitle.instance_of?(String),
            body.nil? || body.instance_of?(String),
            launch_image.nil? || launch_image.instance_of?(String),
            title_loc_key.nil? || title_loc_key.instance_of?(String),
            title_loc_args.nil? || title_loc_args.instance_of?(Array) && title_loc_args.values.all? { |v| v.instance_of?(String) },
            subtitle_loc_key.nil? || subtitle_loc_key.instance_of?(String),
            subtitle_loc_args.nil? || subtitle_loc_args.instance_of?(Array) && subtitle_loc_args.values.all? { |v| v.instance_of?(String) },
            loc_key.nil? || loc_key.instance_of?(String),
            loc_args.nil? || loc_args.instance_of?(Array) && loc_args.values.all? { |v| v.instance_of?(String) },
          ].all?
        end

        private

        attr_reader *%i[
          title
          subtitle
          body
          launch_image
          title_loc_key
          title_loc_args
          subtitle_loc_key
          subtitle_loc_args
          loc_key
          loc_args
        ]
      end

      class Sound < MessageValue
        def initialize(critical:, name:, volume:)
          @critical = critical
          @name = name
          @volume = volume
        end

        def valid?
          [
            critical.nil? || critical.is_a?(Numeric) && critical.to_i == 1,
            name.nil? || name.instance_of?(String),
            volume.nil? || volume.is_a?(Numeric) && (0..1).cover?(volume.to_f),
          ].all?
        end

        private

        attr_reader *%i[critical name volume]
      end

      def initialize(alert:, badge:, sound:, thread_id:, category:, content_available:, mutable_content:, target_content_id:)
        @alert = alert
        @badge = badge
        @sound = sound
        @thread_id = thread_id
        @category = category
        @content_available = content_available
        @mutable_content = mutable_content
        @target_content_id = target_content_id
      end

      def valid?
        [
          # TODO alert
          badge.nil? || badge.is_a?(Numeric),
          # TODO sound
          thread_id.nil? || thread_id.instance_of?(String),
          category.nil? || category.instance_of?(String),
          content_available.nil? || content_available.is_a?(Numeric) && content_available.to_i == 1,
          mutable_content.nil? || mutable_content.is_a?(Numeric) && mutable_content.to_i == 1,
          target_content_id.nil? || target_content_id.instance_of?(String),
        ].all?
        # TODO; content avail pair
      end

      private 

      attr_reader *%i[alert badge sound thread_id category content_available mutable_content target_content_id]
    end

    def initialize(headers:, payload:, fcm_options:)
      @headers = Data.new(headers)
      @payload = payload
      @fcm_options = fcm_options
    end

    def valid?
      [
        headers.valid?,

      ].all?
    end

    private

    attr_reader *%i[headers payload fcm_options]
  end
end


def initialize(headers)
  @headers = headers
end

def valid?
  headers.nil? || headers.instance_of?(headers) && headers.values.all? { |v| v.instance_of?(String) }
end

private

attr_reader :headers
end
end
