require_relative './test_base'

class ReadTest < TestBase

  def test_page_displays
    post '/asked', { 'id':'3456', 'question':'What is your name?' }
    get '/read', { 'id':'3456' }
    assert_response ok
  end

end
