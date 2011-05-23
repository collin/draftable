require 'active_support/configurable'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/string/inflections'
require 'pathname'

module Draftable
  include ActiveSupport::Configurable
    
  def self.method_missing(name, *args)
    if config.send(name).present?
      config.send name
    else
      super
    end
  end
  
  def self.root
    @root ||= Pathname.new(__FILE__).dirname
  end
end