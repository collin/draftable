class Draftable::CLI
  desc "mailer mailer_name", "generate a draftable mailer"
  method_option :config_dir, :type => :string, :default => DEFAULT_CONFIG_DIR
  def mailer(mailer_name)
    load_draftable_config
    
    template "mailer.rb", Draftable.mailer_dir + "/#{mailer_name}_mailer.rb"    
  end
end