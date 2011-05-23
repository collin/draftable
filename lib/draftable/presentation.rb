class Draftable::Presentation
  attr_accessor :name, :as, :content
  
  def initialize(name, options, &block)
    self.name = name
    self.as = options[:as]
    if block_given?
      self.content_block = block 
    else
      self.content_block = generate_content_block
    end
  end
  
  def to_html(presenter)
    assigns = generate_content(presenter)
    assigns.reverse_merge! default_assignments(presenter)
    widget = widget_class.new(assigns)
    widget.to_html
  end
  
  def generate_content(presenter)
    generated_content = presenter.instance_exec &content_block
    unless generated_content.is_a? Hash
      return { :content => generated_content }
    end
    generated_content
  end
  
  def generate_content_block
    instance_eval <<-RUBY, __FILE__, __LINE__ + 1
      proc { #{name} }
    RUBY
  end
  
  def default_assignments(presenter)
    {
      :presentation_name => name,
      :presenter_class => presenter.class.name,
      :presenter_identifier => presenter_identifier(presenter)
    }
  end
  
  def presenter_identifier(presenter)
    [presenter.class.to_s, name].join(":")
  end
  
  def widget_class
    widget_class_name.constantize
  end
  
  def widget_class_name
    "Draftable::Presentation::#{as.to_s.camelcase}"
  end
end
