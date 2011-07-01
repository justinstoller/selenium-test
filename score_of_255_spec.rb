require "rubygems"
require "selenium/client"
require "selenium/rspec/spec_helper"
require "spec/test/unit"

describe "score_of_255_spec" do
  attr_reader :selenium_driver
  alias :page :selenium_driver

  before(:all) do
    @verification_errors = []
    @selenium_driver = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "*firefox",
      :url => "http://change-this-to-the-site-you-are-testing/",
      :timeout_in_second => 60
  end

  before(:each) do
    @selenium_driver.start_new_browser_session
  end
  
  append_after(:each) do
    @selenium_driver.close_current_browser_session
    @verification_errors.should == []
  end
  
  it "test_score_of_255_spec" do
    page.open "file:///home/justin/Desktop/html5test.htm"
    begin
        page.is_text_present("255").should be_true
    rescue ExpectationNotMetError
        @verification_errors << $!
    end
  end
end
