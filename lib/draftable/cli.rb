class Draftable::CLI < Thor
  DEFAULT_MAILER_DIR = "app/mailers"
  DEFAULT_PRESENTER_DIR = "app/presenters"
  DEFAULT_CONFIG_DIR = "config/initializers"
  
  include Thor::Actions
  source_root (Pathname.new(__FILE__).dirname + "templates").to_s
  
  Dir.glob(Draftable.root + "draftable/cli/tasks/*.rb").each do |task_path|
    require task_path
  end
  
  no_tasks do
    def load_draftable_config
      require Pathname.new(options[:config_dir]).expand_path.join("draftable").to_s
    end    
  end
end
