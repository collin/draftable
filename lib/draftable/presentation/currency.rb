class Draftable::Presentation::Currency < Draftable::Presentation::Label
  validates_numericality_of :content
  
  def formatted_content
    number_to_currency super
  end
end