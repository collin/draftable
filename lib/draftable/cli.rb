require "pathname"
class Draftable::CLI < Thor
  DEFAULT_MAILER_DIR = "app/mailers"
  DEFAULT_PRESENTER_DIR = "app/presenters"
  DEFAULT_CONFIG_DIR = "config/initializers"
  
  include Thor::Actions
  source_root (Pathname.new(__FILE__).dirname + "templates").to_s
  
  Dir.glob("draftable/cli/tasks/*.rb").each do |task_path|
    require task_path
  end
  
  def load_draftable_config
    require options[:config_dir] + "draftable.rb"
  end
end
