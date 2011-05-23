class Draftable::Mailer
  extend ActiveSupport::DescendantsTracker
  
  class_attribute :messages
  self.messages = {}.with_indifferent_access
  
  def self.setup(&block)
    if block_given?
      @setup = block
    else
      @setup
    end
  end
  
  def self.message(message_name, options)
    self.messages[message_name] = Draftable::Mailer::Message.new(message_name, options, self)
  end
  
  def self.method_missing(message_name, *args)
    if messages[message_name].present?
      messages[message_name].dup.setup!(*args)
    else
      super
    end
  end
end

