require_relative './test_base'

class ReadTest < TestBase

  def test_page_displays
    post '/asked', { 'q_id':'3456', 'q_text':'What is your name?' }
    get '/read', { 'q_id':'3456' }
    assert_response ok
  end

end
