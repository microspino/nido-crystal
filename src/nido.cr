class Nido
  def	initialize(@base : String|Symbol|Int32|Nido)
  end
  
  def [](key : String|Symbol|Int32|Nido)
    self.class.new("#{@base}:#{key}")
  end
  
  delegate to_s, to: @base
end