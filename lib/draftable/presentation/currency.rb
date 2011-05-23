class Draftable::Presentation::Currency < Draftable::Presentation::Label
  validates_presence_of :content
  
  def formatted_content
    number_to_currency super
  end
end