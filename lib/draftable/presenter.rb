class Draftable::Presenter
  extend ActiveSupport::DescendantsTracker
  
  class_inheritable_accessor :presentations
  self.presentations = {}.with_indifferent_access
  
  attr_accessor :model
  
  def method_missing(method, *args)
    if self.model.respond_to?(method)
      model.send(method)
    else
      super
    end
  end
  
  def present(name)
    presentation = self.class.presentations[name]
    presentation.to_html(self)
  end
  
  def initialize(model)
    self.model = model
  end
  
  def self.collection(models)
    presenters = models.map{ |model| new model }
    Draftable::PresenterCollection.new presenters
  end
  
  def self.present(method_name, options={}, &block)
    self.presentations[method_name] = Draftable::Presentation.new(method_name, options, &block)
  end
  
  # def self.many_to_yaml(presenters)
  #   hash = {}
  #   presenters.each do |presenter|
  #     hash[presenter.class.to_s] = to_yml(presenter)
  #   end
  #   
  #   hash.to_yml
  # end
  # 
  # def self.to_yml(presenter)
  #   hash = {}
  #   presenter.class.presentations.each do |name, presentation|
  #     hash[name] = presentation.to_html
  #   end
  # end
end
