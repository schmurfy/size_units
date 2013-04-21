
module HumanSize
  class << self
    attr_accessor :units
  end
  
  self.units = [
    [1.terabytes, :terabytes, "TB"],
    [1.gigabytes, :gigabytes, "GB"],
    [1.megabytes, :megabytes, "MB"],
    [1.kilobyte,  :kilobyes,  "KB"],
    [1,           :seconds,   "B"]
  ]
  
  ##
  # Format a size for display.
  # 
  # @param [Integer,nil] limit if set this will limit the
  #   number of fields shown (ex: 2 = 2 MB, 3B)
  # 
  # @return [String] the formatted duration
  # 
  def human_size(limit = nil)
    ret = []
    diff = Hash.new(0)
    t = self.to_i
      
    while t > 0
      HumanSize.units.each do |(limit, field)|
        if t >= limit
          diff[field] += 1
          t -= limit
          break
        end
      end
      
    end
    
    ret = []
    
    HumanSize.units.each.with_index do |unit|
      unit_name = unit[1]
      if diff[unit_name] > 0
        ret << "#{diff[unit_name]}#{unit[2]}"
        
        if ret.size == limit
          break
        end
      end
    end
    
    ret.join(', ')
  end
end

Numeric.send(:include, HumanSize)
