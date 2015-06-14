class PostsController < ApplicationController
before_action :set_post, only: [:edit, :update, :destroy]

before_action :authenticate_user!, :except => [:index, :show]

  def index
    # @posts = Post.all
    if params[:mine]
      @posts = current_user.try(:posts)
    else
      @posts = Post.page(params[:page])
    end
  end

  def show
    @post = Post.find(params[:id])
  end 

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
      if @post.save
        @vote_count = 0
        redirect_to @post, notice: 'Post Added'
      else 
        render :new
      end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end  

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post Deleted'
  end

  def upvote
    @post = Post.find(params[:id])
    current_user.upvote << @post
    @vote_count += 1
    redirect_to posts_url, notice: 'Post upvoted!'
  end

  def downvote
    @post = Post.find(params[:id])
    current_user.upvote.delete(@post)
    @vote_count -= 1
    redirect_to posts_url, notice: 'Post downvoted!'
  end

  private

  def set_post
    @post = current_user.post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:url, :title, :description)
  end
end
