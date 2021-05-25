# client
class Renderer
  def render(text_object)
    text = text_object.text
    size = text_object.size_inches
    color = text_object.color

    puts "text: #{text}, size: #{size}, color: #{color}"
  end
end

class TextObject
  attr_reader :text, :size_inches, :color

  def initialize(text, size_inches, color)
    @text = text
    @size_inches = size_inches
    @color = color
  end
end

# adaptee
class BritishTextObject
  attr_reader :string, :size_mm, :colour

  def initialize(string, size_mm, colour)
    @string = string
    @size_mm = size_mm
    @colour = colour
  end
end

# adapter
class BritishTextObjectAdapter
  def initialize(bto)
    @bto = bto
  end

  def text
    @bto.string
  end

  def size_inches
    @bto.size_mm / 25.4
  end

  def color
    @bto.colour
  end
end

renderer = Renderer.new
british_text_object = BritishTextObject.new("british text obj", 1000, "blue")
american_text_object = TextObject.new("text obj", 1000, "green")

renderer.render(BritishTextObjectAdapter.new(british_text_object))
renderer.render(american_text_object)