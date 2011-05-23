class Draftable::Presentation::Label < Draftable::Presentation::Widget
  validates_presence_of :content
  
  def content
    label :class => @presenter_identifier do
      formatted_content
    end
  end
  
  def formatted_content
    @content
  end
end