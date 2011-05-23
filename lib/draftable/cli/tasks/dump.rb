class Draftable::CLI  
  desc "dump", "dump yml representation of draftable code/data"
  method_option :config_dir, :type => :string, :default => DEFAULT_CONFIG_DIR

  def dump(presenter_name)
    load_draftable_config
    Draftable.load_presenters
    Draftable.load_mailers
    
    puts Draftable.loaded_mailers.inspect
  end
end