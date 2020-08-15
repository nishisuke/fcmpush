# frozen_string_literal: true

module Fcmpush
  module Entity
    ApnsFcmOptions = Struct.new(*%i[analytics_label image], keyword_init: true)
    ApnsConfig = Struct.new(*%i[headers payload fcm_options], keyword_init: true)
    FcmOptions = Struct.new(*%i[analytics_label], keyword_init: true)
    # AndroidConfig = Struct.new(*%i[collapse_key ttl priority restricted_package_name data notification fcm_options], keyword_init: true)
    # WebpushConfig = Struct.new(*%i[headers data notification fcm_options], keyword_init: true)
  end
end
