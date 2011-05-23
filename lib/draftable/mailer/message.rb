class Draftable::Mailer::Message
  attr_accessor :name, :factories, :mailer, :presenters, :_setup
  
  def initialize(name, options, mailer, &block)
    self.name = name
    # TODO VALIDATE OPTIONS
    self.factories = options[:factory]
    self.mailer = mailer
    # Potential per-message override
    self._setup = block if block_given?
    self.presenters = []
    
    if Draftable.factory.nil? || !Draftable.factory.respond_to?(:create)
      raise "Draftable must be configured by Draftable.factory = SomeFactoryClass. SomeFactoryClass must respond_to a create method. The create method is passed a symbol representing which object to create."
    end
  end
  
  def setup!(*args)
    self.presenters = []
    args = generate_args_from_factories if args.empty?
    
    message = dup
    message.instance_exec(*args, &setup_block)
    
    message
  end
  
  def setup_block
    _setup || mailer.setup
  end
  
  def presenter(presenter_klass, model)
    if model.is_a?(Array)
      presenters << presenter_klass.collection(model)
    else
      presenters << presenter_klass.new(model)
    end
  end
  
  def factories=(factory)
    @factories = if factory.is_a?(Array)
      factory
    else
      [factory]
    end
  end
  
  def generate_args_from_factories
    self.factories.map do |factory|
      Draftable.factory.create(factory)
    end
  end
end