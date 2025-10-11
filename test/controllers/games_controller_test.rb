require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get games_show_url(id: 'TestPlayer')
    assert_response :success
  end

  test "should get new" do
    get games_new_url
    assert_response :success
  end
end
