class CommentsController < ApplicationController
 
  def create
    @post = Post.find(params[:post_id])
    #@comment = @post.comments.create(params[:comment])
    @comment = @post.comments.create(params[:comment].permit(:title, :text))#?realy permit :title and :text
    redirect_to post_path(@post)
  end
 
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
 
end
