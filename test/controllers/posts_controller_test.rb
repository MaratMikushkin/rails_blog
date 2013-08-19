class PostsControllerTest < ActionController::TestCase
  setup :initialize_post
 
  def teardown
    @post = nil
  end
 
  test "should init post" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: {title: 'Some title'}
    end
   
    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post.id
    assert_response :success
  end
  
  test "should show index" do
    get :index
    assert_response :success
  end
  
  test "should edit post" do
    get :edit, id: @post.id
    assert_response :success
  end
 
  test "should update post" do
    attrs = { title: 'Update title', state_event: 'publish' }
    patch :update, id: @post.id, post: {}
    assert_redirected_to post_path(assigns(:post))
  end
 
  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post.id
    end
 
    assert_redirected_to posts_path
  end
 
  private
 
  def initialize_post
    @post = posts(:one)
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + \
        Base64::encode64("root:123")
  end
 
end
