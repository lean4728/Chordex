require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = 'Chordex'
  end

  test 'should get root' do
    get static_pages_top_url
    assert_response :success
  end

  test "should get top" do
    get static_pages_top_url
    assert_response :success
    assert_select 'title', "#{@base_title} | コード進行から曲を検索"
  end
end
