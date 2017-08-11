require_relative './test_base'

class AnswerTest < TestBase

  def test_page_displays
    get '/answer'
    assert_response ok
  end

end
