require_relative './test_base'

class ReadTest < TestBase

  def test_page_displays
    get '/read'
    assert_response ok
  end

end
