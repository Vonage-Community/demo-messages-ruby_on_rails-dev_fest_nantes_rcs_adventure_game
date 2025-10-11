require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_player_url(locale: :fr)
    assert_response :success
  end
end
