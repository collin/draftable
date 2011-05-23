require 'active_support/configurable'

module Draftable
  include ActiveSupport::Configurable
    
  def self.method_missing(name, *args)
    if config.respond_to?(name)
      config.send name
    else
      super
    end
  end
end