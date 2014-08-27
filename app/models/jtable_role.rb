class JtableRole
  attr_reader :Displaytext, :Value
  
  def jtable(name, id)
    self.Displaytext = name
    self.Value = id
  end
end