
module SizeUnits 
  def bytes() self end
  def kilobytes() 1024 * self end
  def megabytes() 1024**2 * self end
  def gigabytes() 1024**3 * self end
  def terabytes() 1024**4 * self end
  
  instance_methods.select{|m| m !~ /__/}.each do |plural|
    singular = plural.to_s.chop
    alias_method singular, plural
  end
end

Numeric.send(:include, SizeUnits)
