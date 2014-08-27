class Custom
  include ActiveModel::Serialization
  attr_accessor :DisplayText, :Value
  def attributes
    {'DisplayText' => nil, 'Value' => nil}
    
  end
  def jtable1
    self.DisplayText = 'name'
    self.Value = 2
  end
end