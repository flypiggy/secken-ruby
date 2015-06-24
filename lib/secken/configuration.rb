require 'singleton'
module Secken
  class Configuration
    include Singleton

    attr_accessor :app_id, :app_key

    def self.defaults
      @defaults ||= {
        app_id: ENV['SECKEN_ID'],
        app_key: ENV['SECKEN_KEY']
      }
    end

    def initialize
      self.class.defaults.each_pair { |k, v| send("#{k}=", v) }
    end

  end
end
