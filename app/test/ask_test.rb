require_relative './test_base'

class AskTest < TestBase

  def test_page_displays
    get '/ask'
    assert_response ok
  end

end
