class PostsController < ApplicationController
before_action :set_post, only: [:edit, :update, :destroy]
before_action :authenticate_user!, :except => [:index, :show]
before_action :authorized_user, only: [:edit, :update, :destroy]

  def index
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
    @post = current_user.posts.find(params[:id])
    @post.upvote_by current_user
    redirect_to posts_url, notice: 'Post upvoted!'
  end

  def downvote
    @post = current_user.posts.find(params[:id])
    @post.downvote_from current_user
    redirect_to posts_url, notice: 'Post downvoted!'
  end

  private
    
    def set_post
      @post = Post.find(params[:id])
    end

    def authorized_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to posts_path, notice: "Not authorized to edit this post." if @post.nil?
    end

    def post_params
      params.require(:post).permit(:url, :title, :description)
    end
end
