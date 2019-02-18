# frozen_string_literal: true
module UrlHelper
  HELPER = Class.new do
    include Rails.application.routes.url_helpers
    include Singleton

    def default_url_options
      { protocol: protocol, host: ENV["APP_HOST"] }
    end

    private
    def protocol
      if Rails.application.config.force_ssl
        "https"
      else
        "http"
      end
    end
  end

  def self.helper
    HELPER.instance
  end

  def url_helper
    HELPER.instance
  end
end

