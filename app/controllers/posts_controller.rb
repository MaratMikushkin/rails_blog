class PostsController < ApplicationController
  http_basic_authenticate_with name: "root", password: "123",
      except: [:index, :show]

  def new
    @post = PostType.new
  end

  def create
    @post = PostType.new(params[:post])
    
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = PostType.find(params[:id])
  end
  
  def index
    @posts = PostType.all
  end

  def edit
    @post = PostType.find(params[:id])
  end

  def update
    @post = PostType.find(params[:id])
 
    if @post.update(params[:post])
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = PostType.find(params[:id])
    @post.destroy
 
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post)
    end
end
