class Draftable::CLI
  desc "presenter [presenter_name]", "generate a draftable presenter"
  method_option :config_dir, :type => :string, :default => DEFAULT_CONFIG_DIR
  def presenter(presenter_name)
    load_draftable_config
    @presenter_name = presenter_name
    template "presenter.rb", Draftable.presenter_dir.join("#{presenter_name}_presenter.rb").to_s
  end
end