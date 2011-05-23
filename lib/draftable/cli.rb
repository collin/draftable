require "pathname"
class Draftable::CLI < Thor
  include Thor::Actions
  source_root (Pathname.new(__FILE__).dirname + "templates").to_s
  
  DEFAULT_MAILER_DIR = "app/mailers"
  DEFAULT_PRESENTER_DIR = "app/presenters"
  DEFAULT_CONFIG_DIR = "config/initializers"
  
  desc "init", "initialize draftable in your current application"
  method_option :mailer_dir, :type => :string, :default => DEFAULT_MAILER_DIR
  method_option :presenter_dir, :type => :string, :default => DEFAULT_PRESENTER_DIR
  method_option :config_dir, :type => :string, :default => DEFAULT_CONFIG_DIR
  
  def init
    empty_directory DEFAULT_MAILER_DIR
    empty_directory DEFAULT_PRESENTER_DIR
    empty_directory DEFAULT_CONFIG_DIR
    
    template "initializer.rb", DEFAULT_CONFIG_DIR
  end
end
