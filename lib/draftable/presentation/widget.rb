require 'erector'
require 'action_view'

class Draftable::Presentation::Widget < Erector::Widget
  include ActiveModel::Validations
  include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::DateHelper
  
  validates_presence_of :presentation_name,
                        :presenter_class,
                        :presenter_identifier
  
  def initialize(assigns)
    super
    validate!
  end
  
  def read_attribute_for_validation(key)
    instance_variable_get :"@#{key}"
  end
  
  def validate!
    return true if run_validations!
    raise [
      "#{self.class} assigns invalid!",
      "Object: #{inspect}",
      "Errors:",
      errors.inspect
    ].join("\n")
  end
end