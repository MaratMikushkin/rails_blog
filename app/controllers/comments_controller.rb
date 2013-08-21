class CommentsController < ApplicationController
  http_basic_authenticate_with name: "root", password: "123", only: :destroy

  def create
    comment = PostCommentType.new(params[:comment])
    comment.post = resource_post
    comment.save
    
    redirect_to post_path(resource_post)
  end
 
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
 
end
