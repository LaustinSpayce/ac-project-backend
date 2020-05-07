require 'test_helper'

class IslandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @island = islands(:one)
  end

  test "should get index" do
    get islands_url, as: :json
    assert_response :success
  end

  test "should create island" do
    assert_difference('Island.count') do
      post islands_url, params: { island: { island_name: @island.island_name, player_name: @island.player_name } }, as: :json
    end

    assert_response 201
  end

  test "should show island" do
    get island_url(@island), as: :json
    assert_response :success
  end

  test "should update island" do
    patch island_url(@island), params: { island: { island_name: @island.island_name, player_name: @island.player_name } }, as: :json
    assert_response 200
  end

  test "should destroy island" do
    assert_difference('Island.count', -1) do
      delete island_url(@island), as: :json
    end

    assert_response 204
  end
end
