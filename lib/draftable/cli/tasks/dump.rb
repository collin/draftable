class Draftable::CLI  
  desc "dump", "dump yml representation of draftable code/data"
  method_option :config_dir, :type => :string, :default => DEFAULT_CONFIG_DIR

  def dump
    load_draftable_config
    Draftable.load_presenters
    Draftable.load_mailers
    
    dump_hash = {}
    Draftable.loaded_mailers.each do |mailer|
      messages_hash = {}
      mailer.messages.each do |name, message|
        message.setup!
        message_hash = {}
        message.presenters.each do |presenter|
          if presenter.is_a?(Draftable::PresenterCollection)
            presenter_list = []
            presenter.each do |_presenter|
              presenter_list << _presenter.presentations.keys.inject({}) do |memo, name|
                memo[name] = _presenter.present(name).to_s #rescue "FAILURE"
                memo
              end
            end
            message_hash[presenter.first.class.name] = presenter_list
          else
            presenter_hash = {}
            presenter.presentations.keys.each do |name|
              presenter_hash[name] = presenter.present(name).to_s #rescue "FAILURE"
            end
            message_hash[presenter.class.name] = presenter_hash
          end
        end
        messages_hash[name] = message_hash
      end
      dump_hash[mailer.name] = messages_hash
    end
    
    puts dump_hash.to_yaml
  end
end