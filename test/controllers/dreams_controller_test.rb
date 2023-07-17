require "test_helper"

class DreamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dream = dreams(:one)
  end

  test "should get index" do
    get dreams_url, as: :json
    assert_response :success
  end

  test "should create dream" do
    assert_difference("Dream.count") do
      post dreams_url, params: { dream: { content: @dream.content, drawing: @dream.drawing, title: @dream.title, user_id: @dream.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show dream" do
    get dream_url(@dream), as: :json
    assert_response :success
  end

  test "should update dream" do
    patch dream_url(@dream), params: { dream: { content: @dream.content, drawing: @dream.drawing, title: @dream.title, user_id: @dream.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy dream" do
    assert_difference("Dream.count", -1) do
      delete dream_url(@dream), as: :json
    end

    assert_response :no_content
  end
end
