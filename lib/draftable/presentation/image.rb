class Draftable::Presentation::Image < Draftable::Presentation::Widget
  validates_presence_of :src, :alt, :size
  
  def content
    width, height = size.split("x")
    img :class => @presenter_identifier, 
      :src => @src, 
      :alt => @alt, 
      :width => width,
      :height => height
  end
end