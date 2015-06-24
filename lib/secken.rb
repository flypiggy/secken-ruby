require 'secken/version'
require 'secken/configuration'
require 'digest/md5'
require "faraday"
require "json"

module Secken
  class <<  self
    #config
    def config
      Configuration.instance
    end

    def configure
      yield(config)
    end

    def qrcode_for_binding callback = nil
      params = {app_id: config.app_id,
                signature: Digest::MD5.hexdigest("app_id=#{config.app_id}#{config.app_key}")
      }
      #这个貌似没效果.还要我 xhr 去获取吗
      params.merge!({callback: callback}) if callback
      binding.pry

      JSON.parse Faraday.get("https://api.yangcong.com/v2/qrcode_for_auth", params).body
    end

    def qrcode_for_auth callback = nil
    end
  end
end
