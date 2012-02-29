require 'spec_helper'

describe "TempHomepages" do
  
  describe "Tempoarary Home" do
    
    it "should have the content 'Temporary Homepage'" do
      visit '/'
      page.should have_content('Temporary Homepage')
    end
    
    it "should have the correct title" do
      visit '/'
      page.should have_selector('title', text: "Printless")
    end    
  end
  
end
