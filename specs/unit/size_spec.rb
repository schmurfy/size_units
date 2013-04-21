require_relative '../spec_helper'

describe 'TimeDuration' do
  before do
    @b1 = 1
    @kb1 = 1024
    @mb1 = 1024**2
    @gb1 = 1024**3
  end
  
  should 'works' do
    12.human_size.should == "12B"
    1024.human_size.should == "1KB"
    2048.human_size.should == "2KB"
    1044.human_size.should == "1KB, 20B"
    
    (20*@kb1 + 36).human_size.should == "20KB, 36B"
    (2*@gb1 + 200*@mb1 + 780).human_size.should == "2GB, 200MB, 780B"    
  end
  
  
  should 'limite output' do
    (2*@gb1 + 200*@mb1 + 780).human_size(1).should == "2GB"
  end
  
end
