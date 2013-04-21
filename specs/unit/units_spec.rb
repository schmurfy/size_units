require_relative '../spec_helper'

describe 'SizeUnits' do
  should 'works' do
    1.bytes.should == 1
    1024.bytes.should == 1024
    2048.bytes.should == 2048
    
    1.kilobyte.should == 1024
    1.kilobytes.should == 1024
    
    1.megabyte.should == 1024 ** 2
    2.megabytes.should == 2* 1024 ** 2
    
    1.gigabyte.should == 1024 ** 3
    2.gigabytes.should == 2 * 1024 ** 3
    
    1.terabyte.should == 1024**4
    1.terabytes.should == 1024**4
        
  end
end
