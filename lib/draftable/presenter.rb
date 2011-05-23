class Draftable::Presenter
  class_inheritable_accessor :presentations
  self.presentations = {}.with_indifferent_access
  
  attr_accessor :model
  
  def method_missing(method, *args)
    if presentation = self.class.presentations[method]
      presentation.to_html(self)
    else
      super
    end
  end
  
  def initialize(model)
    self.model = model
  end
  
  def self.collection(models)
    Draftable::PresenterCollection.new models.map{ |model| new model }
  end
  
  def self.present(method_name, options={}, &block)
    self.presentations[method_name] = Draftable::Presentation.new(name, options, &block)
  end
  
  def self.many_to_yaml(presenters)
    hash = {}
    presenters.each do |presenter|
      hash[presenter.class.to_s] = to_yml(presenter)
    end
    
    hash.to_yml
  end
  
  def self.to_yml(presenter)
    hash = {}
    presenter.class.presentations.each do |name, presentation|
      hash[name] = presentation.to_html
    end
  end
end
