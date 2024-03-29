class Draftable::CLI
  desc "mailer [mailer_name]", "generate a draftable mailer"
  method_option :config_dir, :type => :string, :default => DEFAULT_CONFIG_DIR
  def mailer(mailer_name)
    load_draftable_config
    @mailer_name = mailer_name
    template "mailer.rb", Draftable.mailer_dir.join("#{mailer_name}_mailer.rb").to_s
  end
end