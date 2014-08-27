class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def jtableOption(name)
    c =Custom.new
    cs = []
    models = name.all
    models.each do |r|
      c.DisplayText = r.name
      c.Value = r.id
      cs << c.serializable_hash
    end   
    return cs
  end
end
