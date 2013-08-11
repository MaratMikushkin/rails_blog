require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup :initialize_comment

  test "should create comment" do
    assert @comment
  end

  test "should destroy comment" do
    delete :destroy, id: @comment.id, post_id: @post.id
    refute Comment.exists?(@comment)
  end

  def initialize_comment
    @post = posts(:one)
       attrs = { commenter: 'I' }
    post :create, comment: attrs, post_id: @post.id
    assert_response :redirect
    @comment = Comment.find_by_commenter(attrs[:commenter])

    @request.env["HTTP_AUTHORIZATION"] = "Basic " + \
        Base64::encode64("root:123")
  end
end
