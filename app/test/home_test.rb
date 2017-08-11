require_relative './test_base'

class HomeTest < TestBase

  def app
    QuestionBook
  end

  def test_page_displays
    get '/'
    assert_response ok
  end

end
