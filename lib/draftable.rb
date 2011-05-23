require 'active_support/configurable'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/string/inflections'
require 'active_support/dependencies/autoload'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/class/attribute'
require 'active_support/descendants_tracker'

require 'pathname'

module Draftable
  include ActiveSupport::Configurable
  extend ActiveSupport::Autoload
  
  autoload :Engine
  
  autoload :Mailer
  autoload :Presenter
  autoload :Presentation
  autoload :PresenterCollection
  
  autoload_under "mailer" do
    autoload :Message
  end
  
  autoload_under "presentation" do
    autoload :Widget
    autoload :Image
    autoload :Label
    autoload :Currency
  end
    
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
  
  def self.mailer_dir
    Pathname.new(config.mailer_dir)
  end
  
  def self.presenter_dir
    Pathname.new(config.presenter_dir)
  end
  
  def self.load_mailers
    Dir.glob(mailer_dir.join("**/*.rb")).each do |path|
      require path
    end    
  end

  def self.load_presenters
    Dir.glob(presenter_dir.join("**/*.rb")).each do |path|
      require path
    end
  end
  
  def self.loaded_presenters
    Draftable::Presenter.descendants
  end
  
  def self.loaded_mailers
    Draftable::Mailer.descendants
  end
end