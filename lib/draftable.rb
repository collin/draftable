require 'active_support/configurable'
require 'active_support/core_ext'
require 'active_support/dependencies/autoload'
require 'active_support/descendants_tracker'
require 'active_model'
require 'pathname'

module Draftable
  include ActiveSupport::Configurable
  extend ActiveSupport::Autoload
  
  autoload :Engine
  
  autoload :Mailer
  autoload :Presenter
  autoload :Presentation
  autoload :PresenterCollection
    
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
    Pathname.new(config.mailer_dir).expand_path
  end
  
  def self.presenter_dir
    Pathname.new(config.presenter_dir).expand_path
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