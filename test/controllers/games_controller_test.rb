require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get player_game_url(locale: :fr, id: 1, player_id: 1)
    assert_response :success
  end

  test "should get new" do
    get new_player_game_url(locale: :fr, player_id: 1)
    assert_response :success
  end
end
