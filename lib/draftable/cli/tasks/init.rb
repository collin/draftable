class Draftable::CLI  
  desc "init", "initialize draftable in your current application"
  method_option :mailer_dir, :type => :string, :default => DEFAULT_MAILER_DIR
  method_option :presenter_dir, :type => :string, :default => DEFAULT_PRESENTER_DIR
  method_option :config_dir, :type => :string, :default => DEFAULT_CONFIG_DIR
  
  def init
    empty_directory options[:mailer_dir]
    empty_directory options[:presenter_dir]
    empty_directory options[:config_dir]
    
    template "initializer.rb", options[:config_dir] + "/draftable.rb"
  end
end