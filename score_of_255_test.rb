require "test/unit"
require "rubygems"
require "selenium/client"

class ScoreOf255Test < Test::Unit::TestCase

  def setup
    @verification_errors = []
    @selenium = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "*firefox",
      :url => "http://change-this-to-the-site-you-are-testing/",
      :timeout_in_second => 60

    @selenium.start_new_browser_session
  end
  
  def teardown
    @selenium.close_current_browser_session
    assert_equal [], @verification_errors
  end
  
  def test_score_of_255_test
    @selenium.open "file:///var/lib/jenkins/userContent/test/html5test.htm"
    begin
        assert @selenium.is_text_present("255")
    rescue
        @verification_errors << $!
    end
  end
end
