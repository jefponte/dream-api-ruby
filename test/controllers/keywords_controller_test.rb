require "test_helper"

class KeywordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @keyword = keywords(:one)
  end

  test "should get index" do
    get keywords_url, as: :json
    assert_response :success
  end

  test "should create keyword" do
    assert_difference("Keyword.count") do
      post keywords_url, params: { keyword: { word: @keyword.word } }, as: :json
    end

    assert_response :created
  end

  test "should show keyword" do
    get keyword_url(@keyword), as: :json
    assert_response :success
  end

  test "should update keyword" do
    patch keyword_url(@keyword), params: { keyword: { word: @keyword.word } }, as: :json
    assert_response :success
  end

  test "should destroy keyword" do
    assert_difference("Keyword.count", -1) do
      delete keyword_url(@keyword), as: :json
    end

    assert_response :no_content
  end
end
