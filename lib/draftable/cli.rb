class Draftable::CLI < Thor
  include Thor::Actions
  DEFAULT_MAILER_DIR
  DEFAULT_PRESENTER_DIR
  
  desc "init", "initialize draftable in your current application"
  method_option :mailer_dir, :type => :string, :default => DEFAULT_MAILER_DIR
  method_option :presenter_dir, :type => :string, :default => DEFAULT_PRESENTER_DIR
end