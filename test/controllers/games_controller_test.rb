require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get game_url(locale: :fr, id: "TestPlayer")
    assert_response :success
  end

  test "should get new" do
    get new_game_url(locale: :fr)
    assert_response :success
  end
end
